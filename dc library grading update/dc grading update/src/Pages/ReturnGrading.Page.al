page 50750 "Return Grading Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Library Table";
    
    layout
    {
        area(Content)
        {
            group("Last Report")
            {
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Title of the Book';
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
            }
            group("New Report")
            {
                field(CustomerID; Rec.CustomerID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer ID field.';
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
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        if Rec.Comment = '' then
                            Error('This field has to be Filled.');
                    end;
                }
                field("Due Date"; Rec."Due Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Book Has to Be returned before this date.';
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
                UpdateStatus: Codeunit "Update Rent Status";
                begin
                    UpdateStatus.HandleBook(Rec,'ReturnBook');
                    ConfirmReturn.ConfirmReturn(Rec);
                    Message('Book returned.');
                end;
            }
        }
    }
}