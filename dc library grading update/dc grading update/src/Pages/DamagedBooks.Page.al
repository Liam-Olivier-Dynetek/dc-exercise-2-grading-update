page 50751 "Damaged Books"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Damaged Books";
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(DamagedBookID; Rec.DamagedBookID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID of the DamagedBook entry';
                    Editable = false;
                }
                field(BookID; Rec.BookID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID of the Book that is Damaged';
                    Editable = false;
                }
                field("Book Title"; Rec."Book Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Title of the book';
                    Caption = 'Specifies the Title of the book';
                }
                field("Book Grading"; Rec."Book Grading")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Damage Rating of the book';
                    Caption = 'Specifies the Damage Rating of the book';
                }
                field("Book Status"; Rec."Book Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the Book Is Availiable or Not';
                    Caption = 'Shows if current book is Availiable or not.';

                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
}
