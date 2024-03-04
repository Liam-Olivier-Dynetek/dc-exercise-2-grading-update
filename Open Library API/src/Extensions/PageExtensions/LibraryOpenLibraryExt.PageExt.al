pageextension 50850 "Library Open Library Ext" extends "Library List"
{
    layout
    {
        addafter("Due Date")
        {

            field(FirstPublishYear; Rec.FirstPublishYear)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the FirstPublishYear field.';
                Caption = 'First Year Published';
            }
            
        }
    }
    actions
    {
        addafter("New Releases")
        {
            action("Get New Books")
            {
                Caption = 'Add Books to collection';
                Image = InsertFromCheckJournal;
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    BuyNewBooks: Page "Add New Books";
                begin
                    BuyNewBooks.RunModal();
                end;
            }
            action("Get Authors")
            {
                Caption = 'Add Authors To collection';
                Image = InsertFromCheckJournal;
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                
                
                trigger OnAction()
                var
                    AddNewAuthors: Page "Add New Authors";
                begin
                    AddNewAuthors.RunModal();
                end;
            }
        }
    }
}