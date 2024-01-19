page 50751 "Damaged Books"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = DamagedBooks;
    
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
                    TableRelation = DamagedBooks.DamagedBookID;
                    Editable = false;
                }
                field(BookID; Rec.BookID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID of the Book that is Damaged';
                    TableRelation = "Library Table".BookID;
                    Editable = false;
                }
                field("Book Title"; Rec."Book Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Title of the book';
                    TableRelation = "Library Table".Title;
                }
                field("Book Grading"; Rec."Book Grading")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Damage Rating of the book';
                    TableRelation = "Library Table"."Quality Rating";
                }
                field("Book Status"; Rec."Book Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the Book Is Availiable or Not';
                    TableRelation = "Library Table".Rented;
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
