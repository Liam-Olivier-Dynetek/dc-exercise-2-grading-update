codeunit 50851 "Populate Library"
{

    procedure InsertBooksIntoLibrary(Query: Text)
    var
        Library: Record "Library Table";
        OpenLibraryAPIRequests: Codeunit "Open Library API Requests";
        ResponseText: Text;
        Title: Text;
        AuthorName: Text;
        FirstPublishYear: Integer;
    begin
        // Call the GetBooksByTitle procedure to get the books by title
        ResponseText := OpenLibraryAPIRequests.GetBooksByTitle(Query);

        // Process the response and get the book details
        OpenLibraryAPIRequests.ProcessResponse(ResponseText);

        // Insert the book details into the Library table
        Library.Init();
        Library.Title := Title;
        Library.Author := AuthorName;
        Library.FirstPublishYear := FirstPublishYear;
        Library.Insert();
    end;

}