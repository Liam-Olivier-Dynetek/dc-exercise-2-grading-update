page 50759 "Total Books Cue"
{
    PageType = CardPart;
    SourceTable = "Library Table";

    layout
    {
        area(content)
        {
            cuegroup(LibraryBooksCue)
            {
                Caption = 'Total Books';
                
                field("Unique Books"; Rec."Unique Books")
                {
                    Caption = 'Open';
                    DrillDownPageId = "Library List";
                    ToolTip = 'Specifies the value of the Open field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}