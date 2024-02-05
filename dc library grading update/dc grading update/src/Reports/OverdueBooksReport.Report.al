report 50750 "Overdue Books Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(OverDueBooks; "Library Table")
        {
            column("BookTitle"; Title)
            {
                IncludeCaption = true;
            }
            column(CustomerName_DataItemName; "Customer Name")
            {
                IncludeCaption = true;
            }
            column(CustomerID_DataItemName; CustomerID)
            {
                IncludeCaption = true;
            }
            column(DueDate_DataItemName; "Due Date")
            {
                IncludeCaption = true;
            }
            column(ReturnPeriod_DataItemName; "Return Period")
            {
                IncludeCaption = true;
            }
            column(Rented_DataItemName; Rented)
            {
                IncludeCaption = true;
            }

            trigger OnPreDataItem()
            begin
                GetOverDueBooks.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if not GetOverDueBooks.Read() then
                    GetOverDueBooks.Close();
            end;
        }
        dataitem("Damaged Books"; "Damaged Books")
        {

            column(BookTitle_DamagedBooks; "Book Title")
            {
                IncludeCaption = true;
            }
            column(DamagedBookID_DamagedBooks; DamagedBookID)
            {
                IncludeCaption = true;
            }
            column(BookGrading_DamagedBooks; "Book Grading")
            {
                IncludeCaption = true;
            }
            column(BookStatus_DamagedBooks; "Book Status")
            {
                IncludeCaption = true;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(General)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = Word;
            LayoutFile = 'OverDueBooks.docx';
        }
    }
    var
        GetOverDueBooks: Query "Overdue Book Query";
}