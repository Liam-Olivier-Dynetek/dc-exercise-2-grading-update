pageextension 50751 BookDetailsUserIdExt extends "Book Details"
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
        }
    }
    
    actions
    {
        addafter("Return This Book")
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
        }
        
    }
    
}