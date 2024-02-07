codeunit 50754 "Grade Books"
{
    trigger OnRun()
    begin
    end;

procedure ConfirmReturn(var LibraryRecord: Record "Library Table");
begin
    UpdateComment(LibraryRecord);
    UpdateQualityRating(LibraryRecord);
end;
    
//Update the Quality Rating
local procedure UpdateQualityRating(var "Library Table": Record "Library Table")// Rec to library Table
begin
    "Library Table"."Quality Rating" := "Library Table"."Quality Rating";
    "Library Table".Modify();
    Message('Book Graded.');
end;

//Update The comment
local procedure UpdateComment(var LibraryRecord: Record "Library Table");
var
    Book: Record "Library Table";
begin
    if Book.Get(LibraryRecord.BookID) then begin
        LibraryRecord.Comment := LibraryRecord.Comment;
        LibraryRecord.Modify();
    end else
        Message('Book %1 not found.', LibraryRecord.Title);
end;

}