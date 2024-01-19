/*
CodeUnit to Loop through all the books in Library Table
and if they have a rating of D set their Status to 'Out of Store' 
and add them to the DamagedBooks Table.

This Loop is run after every OnRun or on modify
*/
codeunit 50750 BookGradingCheck
{
    trigger OnRun()
    var
        CheckRating: Codeunit BookGradingCheck;
        RecordRatings: Record "Library Table";
    begin
        CheckRating.CheckBookQuality(RecordRatings);
    end;

    procedure CheckBookQuality(BookRec: Record "Library Table")
    var
        DamagedBookRec: Record DamagedBooks;
    begin
        BookRec.SetRange("Quality Rating", Enum::"BookQualityRating"::"D");
        if BookRec.FindSet() then begin
            repeat
                DamagedBookRec.SetRange(DamagedBookRec."Book Title", BookRec.Title);
                if DamagedBookRec.IsEmpty() then begin
                    RemoveFromRenting(BookRec);
                    AddToDamagedBooks(BookRec);
                end;
            until BookRec.Next() = 0;
        end;
    end;

    procedure RemoveFromRenting(Book: Record "Library Table")
    var
        UpdateStatus: Codeunit UpdateRentStatus;
    begin
        //Change Book Status to 'Out of Store'
        UpdateStatus.ForceBookStatusToOut(Book);
    end;

    procedure AddToDamagedBooks(Book: Record "Library Table")
    var
        DamagedBook: Record "DamagedBooks";
    begin
        DamagedBook.Init();
        DamagedBook.BookID := Book.BookID;
        DamagedBook."Book Title" := Book."Title";
        DamagedBook."Book Grading" := Book."Quality Rating";
        DamagedBook."Book Status" := Book.Rented;
        DamagedBook.Insert();
    end;
}

