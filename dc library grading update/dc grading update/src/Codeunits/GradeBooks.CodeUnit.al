codeunit 50754 GradeBooks
{
    trigger OnRun()
    begin
        
    end;
    
procedure UpdateQualityRating(var Rec: Record "Library Table"; NewRating: Enum BookQualityRating)
begin
    Rec."Quality Rating" := NewRating;
    Rec.Modify();
    Message('Book Graded.');
end;
}