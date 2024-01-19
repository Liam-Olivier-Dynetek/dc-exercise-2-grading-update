codeunit 50751 UpdateRentStatus
{
    trigger OnRun()
    begin

    end;

    procedure ForceBookStatusToOut(var Rec: Record "Library Table")
    begin
        if Rec."Rented" = Enum::"Book Status"::Available then begin
            Rec."Rented" := Enum::"Book Status"::Damaged;
            Rec.Modify();
        end;
    end;

    procedure ForceBookStatusToAvailiable(var Rec: Record "Library Table")
    begin
        if Rec."Rented" = Enum::"Book Status"::"Out of Store" then begin
            Rec."Rented" := Enum::"Book Status"::Available;
            Rec.Modify();
        end;
    end;

}