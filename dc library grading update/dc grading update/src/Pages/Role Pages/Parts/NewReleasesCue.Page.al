page 50759 "New Releases Cue"
{
    PageType = CardPart;
    SourceTable = Dashboard;

    layout
    {
        area(content)
        {
            cuegroup(LibraryBooksCue)
            {
                Caption = 'Recently Added';
                
                field("New Books"; Rec."New Books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Books field.';
                    DrillDownPageId = "Library List";
                }
            }
        }
    }
}