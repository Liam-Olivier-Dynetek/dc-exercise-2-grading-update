codeunit 50752 "Date Checks"
{
    trigger OnRun()
    begin
        
    end;

procedure CheckDates()
begin
    UpdateDueDateInLibrary();
    CheckOverdueBooks();
end;
    
local procedure UpdateDueDateInLibrary()
var
    Order: Record "Book Orders Table";
    Library: Record "Library Table";
begin
    if Order.FindSet() then begin
        repeat
            Library.SetRange("Title", Order.Title);
            if Library.FindFirst() then begin
                Library."Due Date" := Order."Return Date";
                Library.Modify();
            end;
        until Order.Next() = 0;
    end;
end;

local procedure CheckOverdueBooks()
var
    Library: Record "Library Table";
    CurrentDate: Date;
begin
    CurrentDate := Today();

    if Library.FindSet() then begin
        repeat
            if Library."Due Date" <> 0D then begin
                if Library."Due Date" < CurrentDate then begin
                    Library.Rented := Library.Rented::OverDue;
                    Library.Modify();
                end;
            end;
        until Library.Next() = 0;
    end;
end;



}

