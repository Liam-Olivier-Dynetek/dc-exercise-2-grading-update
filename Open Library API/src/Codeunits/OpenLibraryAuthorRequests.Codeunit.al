codeunit 50851 "Open Library Author Requests"
{
    // procedure GetAuthorsByName(Query: Text): Text
    // var
    //     OpenLibrarySetup: Record "Open Library Setup";
    //     AATRestHelper: Codeunit "AAT REST Helper";
    //     ResponseText: Text;
    //     APIErr: Label 'API Error.\Code: %1\Message: %2\Reason: %3', Comment = '%1=GetHttpStatusCode; %2=GetResponseContentAsText; %3=GetResponseReasonPhrase';
    //     FailedRequestErr: Label 'Failed to send Request. Check URL and try again.';
    // begin
    //     // Initialize the request
    //     OpenLibrarySetup.GetRecordOnce();
    //     OpenLibrarySetup.TestField("OP-LIB No.");
    //     AATRestHelper.LoadAPIConfig(OpenLibrarySetup."OP-LIB No.");
    //     AATRestHelper.Initialize('GET', AATRestHelper.GetAPIConfigBaseEndpoint() + '/authors.json?q=' + Query + '&limit=5');

    //     if not AATRESTHelper.Send() then begin
    //         Commit();
    //         if AATRESTHelper.IsTransmitIssue() then
    //             Error(FailedRequestErr);

    //         Error(
    //             APIErr,
    //             AATRESTHelper.GetHttpStatusCode(),
    //             AATRESTHelper.GetResponseContentAsText(),
    //             AATRESTHelper.GetResponseReasonPhrase()
    //         );
    //     end;

    //     // Get the response text
    //     ResponseText := AATRESTHelper.GetResponseContentAsText();
    //     exit(ResponseText);
    // end;

    procedure GetAuthorsByKey(Query: Text): Text
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
        AATRestHelper.LoadAPIConfig(OpenLibrarySetup."AUTH No.");
        AATRestHelper.Initialize('GET', AATRestHelper.GetAPIConfigBaseEndpoint() + '/' + Query + '.json');

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

    procedure ProcessJson(ResponseText: Text; var TempAuthors: Record "Temp Authors")
    var
        JsonHelper: Codeunit "AAT JSON Helper";
        Name: Text;
        BirthDate: Text;
        JsonToken: JsonToken;
    begin
        JsonHelper.InitializeJsonObjectFromText(ResponseText);
        Name := JsonHelper.SelectJsonValueAsText('$.name', true);
        BirthDate := JsonHelper.SelectJsonValueAsText('$.birth_date', false);

        // Add the values to the temporary table
        TempAuthors.Init();
        TempAuthors.Name := CopyStr(Name, 1, MaxStrLen(TempAuthors.Name));
        TempAuthors."Birth Date" := CopyStr(BirthDate, 1, MaxStrLen(TempAuthors."Birth Date"));
        TempAuthors.Insert(true);

        Message('The data has been successfully added to the temporary table.');
    end;

    local procedure GetTopSubjects(var DocsJsonHelper: Codeunit "AAT JSON Helper"): Text
    var
        JsonArr: JsonArray;
        SubjectName: Text;
        SubjectText: Text;
        SubjectToken: JsonToken;
        SubjectJsonValue: JsonValue;
    begin
        if not DocsJsonHelper.SelectJsonToken('$.top_subjects', false).IsArray then
            exit;
        JsonArr := DocsJsonHelper.SelectJsonToken('$.top_subjects', false).AsArray();


        if JsonArr.Count() = 0 then begin
            Message('The JsonArray is empty.');
            exit;
        end;

        foreach SubjectToken in JsonArr do begin
            SubjectJsonValue := SubjectToken.AsValue();
            SubjectName := SubjectJsonValue.AsText();

            if SubjectText <> '' then
                SubjectText += '; ';
            SubjectText += SubjectName;
        end;
        exit(SubjectText);
    end;
}