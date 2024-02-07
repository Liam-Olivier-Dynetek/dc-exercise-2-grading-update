page 50756 "Role Page"
{
    PageType = RoleCenter;
    Caption = 'Library Role Center';

    layout
    {
        area(RoleCenter)
        {
            group("Library Overview")
            {
                part(Part1; "Library Tracking")
                {
                    ApplicationArea = All;
                }
                part(Part2; "Library List")
                {
                    Caption = 'Books';
                    ApplicationArea = All;
                }
                part(Part3; "Damaged Books")
                {
                    Caption = 'Damaged Books';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Open Library")
            {
                RunObject= page "Library List";
                ToolTip = 'Opens the Library Page';
                Visible = true;
                ApplicationArea = All;
                Image=TileGreen;
            }
        }

        area(Creation)
        {
            // Add actions that create new records here
        }

        area(Reporting)
        {
            // Add actions that run reports here
        }
    }
}
