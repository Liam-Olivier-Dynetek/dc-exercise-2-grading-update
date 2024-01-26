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
            group("General")
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
            }
            group("Damaged Books")
            {

                field("Damaged Books Nos."; Rec."Damaged Books Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Damaged Books Nos. field.';
                }
            }
            group("Library Books")
            {
                field("Library Nos."; Rec."Library Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Library Nos. field.';
                }
            }
        }
    }
}