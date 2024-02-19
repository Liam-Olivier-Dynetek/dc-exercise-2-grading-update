codeunit 50850 "Open Library API Requests"
{





     procedure GetBooksByTitle(Query: Text): Text;
    var
        AATRestHelper: Codeunit "AAT REST Helper";
        ResponseText: Text;
    begin
        // Initialize the request
        AATRestHelper.Initialize('GET', AATRestHelper.GetAPIConfigBaseEndpoint() + Query + '&limit=10');

        if AATRestHelper.Send('Book Search Request') then
            ResponseText := AATRestHelper.GetResponseContentAsText();

        exit(ResponseText);
    end;

     procedure ProcessResponse(ResponseText: Text)
    var
        JSONHelper: Codeunit "AAT JSON Helper";
        JsonResponse: JsonObject;
        DocsArray: JsonArray;
        BookToken: JsonToken;
        Book: JsonObject;
        Title: Text;
        AuthorName: Text;
        FirstPublishYear: Integer;
        Index: Integer;
    begin
        // Parse the JSON response
        if not JsonResponse.ReadFrom(ResponseText) then
            Error('Invalid JSON response');

        // Get the 'docs' array from the response
        JSONHelper.GetJsonArray(JsonResponse, 'docs', DocsArray);

        for Index := 0 to DocsArray.Count - 1 do begin
            DocsArray.Get(Index, BookToken);

            if BookToken.IsObject() then begin
                Book := BookToken.AsObject();

                // Extract the values from the book document
                Title := JSONHelper.SelectJsonValueAsText('title', true);
                AuthorName := JSONHelper.SelectJsonValueAsText('author_name', true);
                FirstPublishYear := JSONHelper.SelectJsonValueAsInteger('first_publish_year', true);

                // Now you can use these values to create new records
                // CreateNewRecord(Title, AuthorName, FirstPublishYear);
            end;
        end;
    end;

}