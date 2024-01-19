pageextension 50750 "LibraryPageExt" extends "Library List"
{

    layout
    {
        addafter("Pages")
        {
            field("Quality Rating"; Rec."Quality Rating")
            {
                ApplicationArea = All;
                ToolTip = 'Displays how damaged a book is.';
            }
        }
    }

    actions
    {
        addafter("Rent Book")
        {
            action("View Transactions")
            {
                ApplicationArea = All;
                Caption = 'View Transactions';
                Image = Account;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;


                trigger OnAction();
                var
                ViewOrders: Page "Book Orders Page";
                begin
                    ViewOrders.RunModal();
                end;
            }

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

    trigger OnOpenPage();
    begin
        Codeunit.Run(Codeunit::BookGradingCheck);
    end;
}
