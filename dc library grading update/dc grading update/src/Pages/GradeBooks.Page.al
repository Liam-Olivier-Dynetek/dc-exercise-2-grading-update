page 50752 "Grade Books"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Library Table";

    layout
    {
        area(Content)
        {
            group(General)
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
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
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
                Caption = 'Save Changes';
                ToolTip = 'Executes the Save Changes action.';

                trigger OnAction();
                begin
                    Codeunit.Run(Codeunit::"Book Grading Check");
                    Message('Book Updated');
                end;
            }

            action(Exit)
            {
                ApplicationArea = All;
                Image = Save;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Exit';
                ToolTip = 'Exits current page';
                
                trigger OnAction();
                begin
                    Message('Closing page...');
                    exit;
                end;
            }
        }
    }
}