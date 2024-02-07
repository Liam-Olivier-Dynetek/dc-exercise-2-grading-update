pageextension 50750 "Library Page Grading Ext" extends "Library List"
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
        addafter(Rented)
        {
            field(Comment; Rec.Comment)
            {
                ApplicationArea = All;
                Caption = 'Comments on current Rating';
                ToolTip = 'Comment on the current rating of the book.';
            }
            field("Due Date"; Rec."Due Date")
            {
                ApplicationArea = All;
                ToolTip = 'Book Has to Be returned before this date.';
                Caption = 'Due Date';
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
                    Rec."Previous Rating" := Rec."Quality Rating";
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
                    Page.RunModal(Page::"Grade Book", Rec);
                end;
            }

            action("Run Overdue Books Report")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Run the Check for Overdue Books.';

                trigger OnAction()
                var
                    DateCheck: Codeunit "Date Checks";
                    LibraryBooks: Record "Library Table";
                begin
                    DateCheck.CheckDates();
                    LibraryBooks.SetRange(Rented, Rec.Rented::OverDue);
                    if LibraryBooks.FindSet() then
                        Report.RunModal(Report::"Overdue Books Report", false, false, LibraryBooks);
                end;
            }
        }
    }

}
