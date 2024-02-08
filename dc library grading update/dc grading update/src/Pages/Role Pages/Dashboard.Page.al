page 50760 "Dash Board"
{
    PageType = Card;
    Caption = 'DashBoard';
    SourceTable = "Library Table";

    layout
    {
        area(Content)
        {
            group(OverView)
            {
                part("Library OverView"; "Library Tracking")
                {
                    ApplicationArea = All;
                }
            }

            group("List of Books")
            {
                part(Library; "Library List")
                {
                    ApplicationArea = All;
                }
            }
            group("Books that need repair")
            {
                part("Damaged Books"; "Damaged Books")
                {
                    ApplicationArea = All;
                }
            }
        }
    }


}