codeunit 50851 "Open Libary Author Requests"
{
    procedure GetAuthorsByName(Query: Text): Text
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
        //fields &fields=name,birth_date,top_work,work_count,top_subjects&
        AATRestHelper.Initialize('GET', AATRestHelper.GetAPIConfigBaseEndpoint() + '/authors.json?q=' + Query + '&limit=5');

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


    procedure ProcessJsonArray(ResponseText: Text; var TempAuthors: Record "Temp Authors")
    var
        AATJSONHelper: Codeunit "AAT JSON Helper";
        DocsJsonHelper: Codeunit "AAT JSON Helper";
        Name: Text;
        TopSubjects: Text;
        BirthDate: Text;
        TopWork: Text;
        WorkCount: Integer;
        JsonToken: JsonToken;
        JsonArr: JsonArray;
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
            Name := DocsJsonHelper.SelectJsonValueAsText('$.name', true);
            TopSubjects := GetTopSubjects(DocsJsonHelper);
            BirthDate := DocsJsonHelper.SelectJsonValueAsText('$.birth_date', false);
            TopWork := DocsJsonHelper.SelectJsonValueAsText('$.top_work', false);
            WorkCount := DocsJsonHelper.SelectJsonValueAsInteger('$.work_count', false);

            // Add the values to the temporary table
            TempAuthors.Init();
            TempAuthors.Name := CopyStr(Name, 1, MaxStrLen(TempAuthors.Name));
            TempAuthors.Top_Subjects := CopyStr(TopSubjects, 1, MaxStrLen(TempAuthors.Top_Subjects));
            TempAuthors."Birth Date" := CopyStr(BirthDate, 1, MaxStrLen(TempAuthors."Birth Date"));
            TempAuthors.Top_Work := CopyStr(TopWork, 1, MaxStrLen(TempAuthors.Top_Work));
            TempAuthors."Work Count" := WorkCount;
            TempAuthors.Insert(true);

        end;
        Message('The data has been successfully added to the temporary table.');
    end;



    procedure GetTopSubjects(var DocsJsonHelper: Codeunit "AAT JSON Helper"): Text
    var
        AuthorJsonHelper: Codeunit "AAT JSON Helper";
        JsonArr: JsonArray;
        SubjectName: Text;
        SubjectText: Text;
        SubjectToken: JsonToken;
        SubjectJsonValue: JsonValue;
    begin
        // AuthorJsonHelper.InitializeJsonObjectFromToken(JsonToken);
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
                SubjectText += '| ';
            SubjectText += SubjectName;
        end;
        exit(SubjectText);
    end;
}