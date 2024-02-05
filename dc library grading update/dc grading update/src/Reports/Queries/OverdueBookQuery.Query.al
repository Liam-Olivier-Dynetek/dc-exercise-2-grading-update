query 50750 "Overdue Book Query"
{
    QueryType = Normal;

    elements
    {
        dataitem(OverDueBook; "Library Table")
        {
            column(Title; Title)
            {
            }
            column(BookID; BookID)
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(CustomerID; CustomerID)
            {
            }
            column(DueDate; "Due Date")
            {
            }
            column(ReturnPeriod; "Return Period")
            {
            }
            column(QualityRating; "Quality Rating")
            {
            }
        }
    }
}