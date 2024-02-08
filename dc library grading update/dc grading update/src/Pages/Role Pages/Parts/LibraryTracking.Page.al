page 50755 "Library Tracking"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Library Table";

    layout
    {
        area(Content)
        {
            group("Tracked fields")
            {
                
                field("Total Available Books"; Rec."Available Books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Available Books field.';
                }
                field("Total Damaged Books"; Rec."Damaged Books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Damaged Books field.';
                }
                field("Total New Books"; Rec."New Books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total New Books field.';
                }
                field("Total Unique Books"; Rec."Unique Books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Unique Books field.';
                }
                field("Total Rented Books"; Rec."Rented Books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Rented Books field.';
                }
            }
        }
    }
}
