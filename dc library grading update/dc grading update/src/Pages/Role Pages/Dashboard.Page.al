page 50760 "Dash Board"
{
    PageType = Card;
    Caption = 'DashBoard';
    SourceTable = "Library Table";

    layout
    {
        area(Content)
        {
            group(Filters)
            {

                field("Start Date"; "Starting Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    Caption = 'Start Date';
                    ApplicationArea = All;
                    Editable = true;
                }
                field("End Date"; "Ending Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    Caption = 'Ending Date';
                    ApplicationArea = All;
                    Editable = true;
                }
            }
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

    actions
    {
        area(Processing)
        {
            action("Check for Books in DateFilter")
            {
                Caption = 'Check for Books in DateFilter';
                Image = UpdateDescription;
                Promoted = true;
                ToolTip = 'Check for Books in DateFilter';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    Rec.SetRange(SystemCreatedAt, "Starting Date", "Ending Date");
                end;
            }

            //     action("Check for Books in DateFilter")
            //     {
            //         Caption = 'Action Caption';
            //         Image = UpdateDescription;
            //         Promoted = true;
            //         ToolTip = 'Your tooltip here';
            //         ApplicationArea = All;

            //         trigger OnAction();
            //         var
            //             StartDate: Date;
            //             EndDate: Date;
            //             StartTime: Time;
            //             EndTime: Time;
            //             StartDateTime: DateTime;
            //             EndDateTime: DateTime;
            //         begin
            //             EndDate := Today();
            //             StartDate := CalcDate('<-2M>', EndDate);
            //             StartTime := Time(0, 0, 0);
            //             EndTime := Time(23, 59, 59);
            //             StartDateTime := CreateDateTime(StartDate, StartTime);
            //             EndDateTime := CreateDateTime(EndDate, EndTime);
            //             Rec.SetRange(Date, StartDateTime, EndDateTime);
            //         end;
            //     }
            // }
        }
    }
    var
        "Starting Date": DateTime;
        "Ending Date": DateTime;
}