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
local procedure UpdateQualityRating(var Rec: Record "Library Table")
begin
    Rec."Quality Rating" := Rec."Quality Rating";
    Rec.Modify();
    Message('Book Graded.');
end;

//Update The comment
local procedure UpdateComment(var LibraryRecord: Record "Library Table");
var
    BookRec: Record "Library Table";
begin
    if BookRec.Get(LibraryRecord.Title) then begin
        LibraryRecord.Comment := LibraryRecord.Comment;
        LibraryRecord.Modify();
    end else
        Message('Book %1 not found.', LibraryRecord.Title);
end;

}