page 50750 "Return Grading Page"
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
                }
                field(CustomerID; Rec.CustomerID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer ID field.';
                }
                field(Rented; Rec.Rented)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows if the Book is Availiable or Not.';
                }
                field("Previous Grading"; Rec."Previous Rating")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Previous Grading field.';
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
                    trigger OnValidate()
                    begin
                        if Rec.Comment = '' then
                            Message('This field has to be Filled.');
                    end;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(Confirm)
            {
                ApplicationArea = All;
                Caption = 'Confirm';
                Image = Completed;
                
                trigger OnAction()
                var
                ConfirmReturn: Codeunit "Grade Books";
                begin
                    ConfirmReturn.ConfirmReturn(Rec);
                end;
            }
        }
    }
}