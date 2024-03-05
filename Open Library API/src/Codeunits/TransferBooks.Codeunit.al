codeunit 50854 "Transfer Books"
{
    procedure AddToLibrary()
    var
        TempLibrary: Record "Temp Library";
        Library: Record "Library Table";
    begin
        if TempLibrary.FindSet() then
            repeat
                Library.SetRange(Title, TempLibrary.Title);
                Library.SetRange(Author, TempLibrary.Author);
                Library.SetRange(ISBN, TempLibrary.ISBN);
                if not Library.FindFirst() then begin
                    Library.Init();
                    Library.Title := TempLibrary.Title;
                    Library."Cover Image" := TempLibrary."Cover Image";
                    Library.Author := TempLibrary.Author;
                    Library.ISBN := TempLibrary.ISBN;
                    Library.Pages := TempLibrary.Pages;
                    Library.Publisher := TempLibrary.Publisher;
                    Library.FirstPublishYear := TempLibrary.FistPublishYear;
                    Library.BookPrice := 500;
                    Library.Insert(true);
                end;
            until TempLibrary.Next() = 0;
    end;

}