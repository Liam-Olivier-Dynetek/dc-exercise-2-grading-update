codeunit 50750 "Book Grading Check"
{
    trigger OnRun()
    var
        RecordRatings: Record "Library Table";
    begin
        CheckBookQuality(RecordRatings);
    end;

    procedure CheckBookQuality(BookRec: Record "Library Table")
    var
        DamagedBookRec: Record "Damaged Books";
        UpdateStatus: Codeunit "Update Rent Status";
    begin
        BookRec.SetRange("Quality Rating", Enum::"Book Quality Rating"::"D");
        if BookRec.FindSet() then begin
            repeat
                DamagedBookRec.SetRange(DamagedBookRec."Book Title", BookRec.Title);
                if DamagedBookRec.IsEmpty() then begin
                    ChangeStatusToOut(BookRec);
                    AddToDamagedBooks(BookRec);
                end;
            until BookRec.Next() = 0;
        end;
    end;

    local procedure ChangeStatusToOut(Book: Record "Library Table")
    var
        UpdateStatus: Codeunit "Update Rent Status";
        Action: Text;
    begin
        Action := 'RentBook';
        UpdateStatus.HandleBook(Book,Action);
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
}

