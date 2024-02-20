codeunit 50850 "Open Library API Requests"
{


    procedure GetBooksByTitle(Query: Text): Text;
    var
        OpenLibrarySetup: Record "Open Library Setup";
        AATRestHelper: Codeunit "AAT REST Helper";
        ResponseText: Text;

    begin
        // Initialize the request
        OpenLibrarySetup.GetRecordOnce();
        OpenLibrarySetup.TestField("OP-LIB No.");
        AATRestHelper.LoadAPIConfig(OpenLibrarySetup."OP-LIB No.");
        AATRestHelper.Initialize('GET', AATRestHelper.GetAPIConfigBaseEndpoint() + '?q=' + Query + '&offset=10');

        if AATRestHelper.Send('Book Search Request') then
            ResponseText := AATRestHelper.GetResponseContentAsText();

        exit(ResponseText);
    end;

    procedure ProcessResponse(ResponseText: Text)
    var
        JSONHelper: Codeunit "AAT JSON Helper";
        DataObject: JsonObject;
        Title: Text;
        Author: Text;
        FirstYearReleased: Text;
    begin
        // Parse the JSON response
        if not DataObject.ReadFrom(ResponseText) then
            Error('Invalid JSON response');

        Title := JSONHelper.GetJsonTokenAsValue(DataObject, 'Title').AsText();
        Author := JSONHelper.GetJsonTokenAsValue(DataObject, 'Author').AsText();
        FirstYearReleased := JSONHelper.GetJsonTokenAsValue(DataObject, 'FirstYearReleased').AsText();
    end;



    procedure InsertBooksIntoLibrary(Query: Text)
    var
        Library: Record "Library Table";
        TempLibrary: Record "Library Table" temporary;
        ResponseText: Text;
        Title: Text;
        AuthorName: Text;
        FirstPublishYear: Integer;
    begin
        ResponseText := GetBooksByTitle(Query);
        ProcessResponse(ResponseText);

        // Insert the book details into the temporary Library table
        TempLibrary.Init();
        TempLibrary.Title := Title;
        TempLibrary.Author := AuthorName;
        TempLibrary.FirstPublishYear := FirstPublishYear;
        TempLibrary.Insert();

        // If the user confirms, insert the book details into the actual Library table
        Library := TempLibrary;
        Library.Insert();
    end;
}