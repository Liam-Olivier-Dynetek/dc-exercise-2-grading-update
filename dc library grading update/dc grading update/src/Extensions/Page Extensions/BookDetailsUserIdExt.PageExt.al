pageextension 50751 "Book Details UserId Ext" extends "Book Details"
{
    layout
    {
        addafter("PublicationDate")
        {
            field(UserID; Rec.UserID)
            {
                ApplicationArea = All;
                ToolTip = 'UserID';
                TableRelation = Contact."No.";
            }
            field("Quality Rating"; Rec."Quality Rating")
            {
                ApplicationArea = All;
                ToolTip = 'Displays how damaged a book is.';
            }
            field("Previous Grading"; Rec."Previous Rating")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Previous Grading field.';
                Editable = false;
            }
            field(Comment; Rec.Comment)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Comment field.';
            }
        }
    }
    
    actions
    {
        addafter("Rent This Book")
        {
            action("Grade Book")
            {
                ApplicationArea = All;
                Caption = 'Grade Book';
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    Page.RunModal(Page::"Grade Book",Rec)
                end;
            }
            action("Return Book")
            {
                ApplicationArea = All;
                Caption = 'Return This book';
                Image = ReturnOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    Page.RunModal(Page::"Return Grading Page",Rec)
                end;
            }
        }
        
    }
    
}