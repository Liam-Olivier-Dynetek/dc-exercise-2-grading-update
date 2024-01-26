codeunit 50750 "Book Grading Check"
{
    TableNo = "Library Table";

    trigger OnRun()
    var
        RecordRatings: Record "Library Table";
    begin
        CheckBookQuality();
        CheckBookStatusAndUpdateRating();
        ArchiveLowQualityBooks();
    end;

    procedure CheckBookQuality()
    var
        Book: Record "Library Table";
        DamagedBook: Record "Damaged Books";
        UpdateStatus: Codeunit "Update Rent Status";
    begin
        Book.SetRange("Quality Rating", Enum::"Quality Grading"::"D");
        if Book.FindSet() then begin
            repeat
                DamagedBook.SetRange(DamagedBook."Book Title", Book.Title);
                if DamagedBook.IsEmpty() then begin
                    ChangeStatusToOut(Book);
                    AddToDamagedBooks(Book);
                end;
            until Book.Next() = 0;
        end;
    end;

    local procedure ChangeStatusToOut(Book: Record "Library Table")
    var
        UpdateStatus: Codeunit "Update Rent Status";
    begin
        
        UpdateStatus.HandleBook(Book,'DamagedBook');
    end;

    local procedure AddToDamagedBooks(Book: Record "Library Table")
    var
        DamagedBook: Record "Damaged Books";
    begin
        DamagedBook.Init();
        DamagedBook.BookID := Book.BookID;
        DamagedBook."Book Title" := Book."Title";
        DamagedBook."Book Grading" := Book."Quality Rating";
        DamagedBook."Book Status" := Book.Rented;
        DamagedBook.Insert();
    end;


local procedure CheckBookStatusAndUpdateRating()
var
    Book: Record "Library Table";
begin
    if Book.FindSet() then begin
        repeat
            if (Book.Rented <> Book.Rented::"Out of Store") and 
               ((Book."Quality Rating" = Enum::"Quality Grading"::"A") or 
                (Book."Quality Rating" = Enum::"Quality Grading"::"B") or 
                (Book."Quality Rating" = Enum::"Quality Grading"::"C")) then begin
                Book.Rented := Book.Rented::Available;
                Book.Modify();
            end;
        until Book.Next() = 0;
    end;
end;

local procedure ArchiveLowQualityBooks()
var
    Book: Record "Library Table";
begin
    if Book.FindSet() then begin
        repeat
            if Book."Quality Rating" = Enum::"Quality Grading"::"F" then begin
                Book.Rented := Book.Rented::Archived;
                Book.Modify();
            end;
        until Book.Next() = 0;
    end;
end;

}

