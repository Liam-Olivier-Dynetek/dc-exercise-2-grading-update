page 50752 "Grade Book"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Library Table";
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Title of the Book';
                    Editable = false;
                }
                field(Rented; Rec.Rented)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows if the Book is Availiable or Not.';
                    Editable = false;
                }
                field("Quality Rating"; Rec."Quality Rating")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays how damaged a book is.';
                }
                //Need Area for Adding a comment
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(SaveChanges)
            {
                ApplicationArea = All;
                Image = Save;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction();
                begin
                    Rec.Modify();
                    Codeunit.Run(Codeunit::"Book Grading Check");
                    Message('Book Updated');
                end;
            }
        }
    }
}