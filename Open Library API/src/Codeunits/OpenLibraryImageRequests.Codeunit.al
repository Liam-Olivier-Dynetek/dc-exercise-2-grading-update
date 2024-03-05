codeunit 50853 "Open Library Image Requests"
{
    procedure GetBookCovers(OLID: Text): InStream
    var
        OpenLibrarySetup: Record "Open Library Setup";
        RestHelper: Codeunit "AAT REST Helper";
        ResponseStream: InStream;
        APIErr: Label 'API Error.\Code: %1\Message: %2\Reason: %3', Comment = '%1=GetHttpStatusCode; %2=GetResponseContentAsText; %3=GetResponseReasonPhrase';
        FailedRequestErr: Label 'Failed to send Request. Check URL and try again.';
    begin
        // Initialize the request
        OpenLibrarySetup.GetRecordOnce();
        OpenLibrarySetup.TestField("Cover No.");
        RestHelper.LoadAPIConfig(OpenLibrarySetup."Cover No.");
        //Base Endpoint https://covers.openlibrary.org/b/
        RestHelper.Initialize('GET', RestHelper.GetAPIConfigBaseEndpoint() + '/olid/' + OLID + '-L.jpg');

        if not RestHelper.Send() then begin
            Commit();
            if RestHelper.IsTransmitIssue() then
                Error(FailedRequestErr);

            Error(
                APIErr,
                RestHelper.GetHttpStatusCode(),
                RestHelper.GetResponseContentAsText(),
                RestHelper.GetResponseReasonPhrase()
            );
        end;

        // Get the response InStream
        // Message(RestHelper.GetResponseContentAsText());
        ResponseStream := RestHelper.GetResponseAsInStream();
        exit(ResponseStream);
    end;
}