codeunit 50751 "Update Rent Status"
{
    trigger OnRun()
    begin
        
    end;


procedure HandleBook(var "Library Table": Record "Library Table"; Action: Text)
begin
    case Action of
        'DamagedBook':
            begin
                DamagedBook("Library Table");
            end;
        'ReturnBook':
            begin
                ReturnBook("Library Table");
            end;
        'RentBook':
            begin
                RentBook("Library Table");
            end;
        else
            Error('Invalid action: %1', Action);
    end;
end;
    local procedure DamagedBook(var "Library Table": Record "Library Table")
    begin
        if "Library Table"."Rented" = Enum::"Book Status"::Available then begin
            "Library Table"."Rented" := Enum::"Book Status"::Damaged;
            "Library Table".Modify();
        end;
    end;

   local procedure ReturnBook(var "Library Table": Record "Library Table")
    begin
        if "Library Table"."Rented" = Enum::"Book Status"::"Out of Store" then begin
            "Library Table"."Rented" := Enum::"Book Status"::Available;
            "Library Table".Modify();
        end;
    end;

local procedure RentBook(var "Library Table": Record "Library Table")
    begin
        if "Library Table"."Rented" = Enum::"Book Status"::"Available" then begin
            "Library Table"."Rented" := Enum::"Book Status"::"Out of Store";
            "Library Table".Modify();
        end;
    end;
}