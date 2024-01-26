page 50754 "Library General Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Library General Setup";

    layout
    {
        area(Content)
        {
            group("Library Books")
            {
                field("Library Nos."; Rec."Library Nos.")
                {
                    Editable = true;
                    ApplicationArea = All;
                    ToolTip = 'Number Series for the Library Books';
                }
            }
            group("Damaged Books")
            {
                field("Damaged Books Nos."; Rec."Damaged Books Nos.")
                {
                    Editable = true;
                    ApplicationArea = All;
                    ToolTip = 'Number Series for the Damaged Books';
                }
            }
            
        }
    }
}