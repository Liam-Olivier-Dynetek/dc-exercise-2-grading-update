codeunit 50751 "Update Rent Status"
{
    trigger OnRun()
    var
    UpdateBookStatus: Codeunit "Update Rent Status";
    Rec: Record "Library Table";
    Action: Text;
    begin
        UpdateBookStatus.HandleBook(Rec,Action);
    end;


procedure HandleBook(var Rec: Record "Library Table"; Action: Text)
begin
    case Action of
        'DamagedBook':
            begin
                DamagedBook(Rec);
            end;
        'ReturnBook':
            begin
                ReturnBook(Rec);
            end;
        'RentBook':
            begin
                RentBook(Rec);
            end;
        else
            Error('Invalid action: %1', Action);
    end;
end;
    local procedure DamagedBook(var Rec: Record "Library Table")
    begin
        if Rec."Rented" = Enum::"Book Status"::Available then begin
            Rec."Rented" := Enum::"Book Status"::Damaged;
            Rec.Modify();
        end;
    end;

   local procedure ReturnBook(var Rec: Record "Library Table")
    begin
        if Rec."Rented" = Enum::"Book Status"::"Out of Store" then begin
            Rec."Rented" := Enum::"Book Status"::Available;
            Rec.Modify();
        end;
    end;

local procedure RentBook(var Rec: Record "Library Table")
    begin
        if Rec."Rented" = Enum::"Book Status"::"Available" then begin
            Rec."Rented" := Enum::"Book Status"::"Out of Store";
            Rec.Modify();
        end;
    end;
}