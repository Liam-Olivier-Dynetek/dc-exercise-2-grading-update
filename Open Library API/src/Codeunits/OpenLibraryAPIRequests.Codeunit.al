codeunit 50850 "Open Library API Requests"
{


    procedure GetBooksByTitle(Query: Text): Text
    var
        OpenLibrarySetup: Record "Open Library Setup";
        AATRestHelper: Codeunit "AAT REST Helper";
        ResponseText: Text;
        APIErr: Label 'API Error.\Code: %1\Message: %2\Reason: %3', Comment = '%1=GetHttpStatusCode; %2=GetResponseContentAsText; %3=GetResponseReasonPhrase';
        FailedRequestErr: Label 'Failed to send Request. Check URL and try again.';
    begin
        // Initialize the request
        OpenLibrarySetup.GetRecordOnce();
        OpenLibrarySetup.TestField("OP-LIB No.");
        AATRestHelper.LoadAPIConfig(OpenLibrarySetup."OP-LIB No.");
        AATRestHelper.Initialize('GET', AATRestHelper.GetAPIConfigBaseEndpoint() + '?title=' + Query + '&fields=title,author_name,number_of_pages_median,first_publish_year,isbn,publisher&limit=5');

        if not AATRESTHelper.Send() then begin
            Commit();
            if AATRESTHelper.IsTransmitIssue() then
                Error(FailedRequestErr);

            Error(
                APIErr,
                AATRESTHelper.GetHttpStatusCode(),
                AATRESTHelper.GetResponseContentAsText(),
                AATRESTHelper.GetResponseReasonPhrase()
            );
        end;

        // Get the response text
        ResponseText := AATRESTHelper.GetResponseContentAsText();
        exit(ResponseText);
    end;

    procedure ProcessJsonArray(ResponseText: Text; var TempOpenLibrary: Record "Temp Library")
    var
        AATJSONHelper: Codeunit "AAT JSON Helper";
        DocsJsonHelper: Codeunit "AAT JSON Helper";
        Title: Text;
        AuthorName: Text;
        Pages: Integer;
        JsonToken: JsonToken;
        JsonArr: JsonArray;
        FistPublishYear: Integer;
        ISBN: Text;
        Publisher: Text;
    begin

        AATJSONHelper.InitializeJsonObjectFromText(ResponseText);
        JsonArr := AATJSONHelper.SelectJsonToken('$.docs', true).AsArray();
        // Check if the JsonArray is not empty
        if JsonArr.Count() = 0 then begin
            Message('The JsonArray is empty.');
            exit;
        end;

        foreach JsonToken in JsonArr do begin
            DocsJsonHelper.InitializeJsonObjectFromToken(JsonToken);
            Title := DocsJsonHelper.SelectJsonValueAsText('$.title', true);
            AuthorName := GetAuthors(JsonToken);
            Pages := DocsJsonHelper.SelectJsonValueAsInteger('$.number_of_pages_median', false);
            FistPublishYear := DocsJsonHelper.SelectJsonValueAsInteger('$.first_publish_year', false);
            ISBN := GetISBN(JsonToken);
            Publisher := GetAuthors(JsonToken);


            // Add the values to the temporary table
            TempOpenLibrary.Init();
            TempOpenLibrary.Title := CopyStr(Title, 1, MaxStrLen(TempOpenLibrary.Title));
            TempOpenLibrary.Author := CopyStr(AuthorName, 1, MaxStrLen(TempOpenLibrary.Author));
            TempOpenLibrary.Pages := Pages;
            TempOpenLibrary.FistPublishYear := FistPublishYear;
            TempOpenLibrary.isbn := CopyStr(ISBN, 1, MaxStrLen(TempOpenLibrary.isbn));
            TempOpenLibrary.Publisher := CopyStr(Publisher, 1, MaxStrLen(TempOpenLibrary.Publisher));
            TempOpenLibrary.Insert(true);

        end;
        Message('The data has been successfully added to the temporary table.');
    end;

    procedure GetAuthors(var JsonToken: JsonToken): Text
    var
        AuthorJsonHelper: Codeunit "AAT JSON Helper";
        JsonArr: JsonArray;
        AuthorName: Text;
        AuthorsText: Text;
        AuthorToken: JsonToken;
        AuthorJsonValue: JsonValue;
    begin
        AuthorJsonHelper.InitializeJsonObjectFromToken(JsonToken);
        JsonArr := AuthorJsonHelper.SelectJsonToken('$.author_name', false).AsArray();

        if JsonArr.Count() = 0 then begin
            Message('The JsonArray is empty.');
            exit;
        end;

        foreach AuthorToken in JsonArr do begin
            AuthorJsonValue := AuthorToken.AsValue();
            AuthorName := AuthorJsonValue.AsText();

            if AuthorsText <> '' then
                AuthorsText += '| ';
            AuthorsText += AuthorName;
        end;
        exit(AuthorsText);
    end;

    //TODO add ISBN, publisher,
    procedure GetPublisher(var JsonToken: JsonToken): Text
    var
        PublisherJsonHelper: Codeunit "AAT JSON Helper";
        PublisherArr: JsonArray;
        PublisherNo: Text;
        PublisherText: Text;
        PublisherToken: JsonToken;
        PublisherValue: JsonValue;
    begin
        PublisherJsonHelper.InitializeJsonObjectFromToken(JsonToken);
        PublisherArr := PublisherJsonHelper.SelectJsonToken('$.publisher', false).AsArray();

        if PublisherArr.Count() = 0 then begin
            Message('The JsonArray is empty.');
            exit;
        end;

        foreach PublisherToken in PublisherArr do begin
            PublisherValue := PublisherToken.AsValue();
            PublisherNo := PublisherValue.AsText();

            if PublisherText <> '' then
                PublisherText += '| ';
            PublisherText += PublisherNo;
        end;
        exit(PublisherText);
    end;

    procedure GetISBN(var JsonToken: JsonToken): Text
    var
        ISBNJsonHelper: Codeunit "AAT JSON Helper";
        JsonArr: JsonArray;
        IsbnNo: Text;
        IsBnText: Text;
        IsbnToken: JsonToken;
        IsbnValue: JsonValue;
    begin
        ISBNJsonHelper.InitializeJsonObjectFromToken(JsonToken);
        JsonArr := ISBNJsonHelper.SelectJsonToken('$.isbn', false).AsArray();

        if JsonArr.Count() = 0 then begin
            Message('The JsonArray is empty.');
            exit;
        end;

        foreach IsbnToken in JsonArr do begin
            IsbnValue := IsbnToken.AsValue();
            IsbnNo := IsbnValue.AsText();

            if IsBnText <> '' then
                IsBnText += '| ';
            IsBnText += IsbnNo;
        end;
        exit(IsBnText);
    end;
}