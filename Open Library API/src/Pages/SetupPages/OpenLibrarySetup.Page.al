page 50851 "Open Library Setup"
{
    
    PageType = Card;
    SourceTable = "Open Library Setup";
    Caption = 'Open Library API Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;

    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("AUTH No."; Rec."AUTH No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AUTH No. field.';
                }
                field("OP-LIB No."; Rec."OP-LIB No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the OP-LIB No. field.';
                }
                field("Author No."; Rec."Author No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Author No. field.';
                }
                
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;
    
}
