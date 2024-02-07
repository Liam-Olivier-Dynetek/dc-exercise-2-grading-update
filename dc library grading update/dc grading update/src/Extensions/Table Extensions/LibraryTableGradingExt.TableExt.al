// Table Extension
tableextension 50750 "Library Table Grading Ext" extends "Library Table"
{
    fields
    {
        field(50100; "Quality Rating"; Enum "Quality Grading")
        {
            Caption = 'Quality Rating';
        }
        field(50101; "UserID"; Code[20])
        {
            Caption = 'UserID';
            TableRelation = Contact."No.";
        }
        field(50102; "Previous Rating"; Enum "Quality Grading")
        {
            Caption = 'Previous Grading';
        }
        field(50103; Comment; Text[150])
        {
            Caption = 'Comment';
        }
        field(50104; "Due Date"; Date)
        {
            Caption = 'Due Date';
            TableRelation = "Book Orders Table"."Retrun Date";
        }

        field(50105; "Unique Books"; Integer)
        {
            CalcFormula = count("Library Table");
            FieldClass = FlowField;
        }
        field(50106; "New Books"; Integer)
        {
            CalcFormula = count("Library Table" WHERE("Quality Rating" = Const(A)));
            FieldClass = FlowField;
        }
        field(50107; "Damaged Books"; Integer)
        {
            CalcFormula = count("Library Table" WHERE(Rented = CONST(Damaged)));
            FieldClass = FlowField;
        }
        field(50108; "Rented Books"; Integer)
        {
            CalcFormula = count("Library Table" WHERE(Rented = CONST("Out of Store")));
            FieldClass = FlowField;
        }
        field(50109; "Available Books"; Integer)
        {
            CalcFormula = count("Library Table" WHERE(Rented = CONST(Available)));
            FieldClass = FlowField;
        }
        // field(50110; "Recently Added Books"; Integer)
        // {
        //     // CalcFormula = count("Library Table" WHERE("Date Added" = FILTER(Workdate()-30..WorkDate)));
        //     FieldClass = FlowField;
        // }
    }

    trigger OnInsert()
    var
        LibrarySetup: Record "Library General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if Rec.BookID = '' then begin
            LibrarySetup.GetRecordOnce();
            LibrarySetup.TestField("Library Nos.");
            Rec.Validate(BookID, NoSeriesMgt.GetNextNo(LibrarySetup."Library Nos.", WorkDate(), true));
        end;
    end;
}