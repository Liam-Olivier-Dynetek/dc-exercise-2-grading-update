table 50751 "Returned Books"
{
    DataPerCompany = false;
    fields
    {
        field(1; "Order ID"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Customer ID"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Customer Name"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Book Title"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(5; "Return Date"; Date)
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Order ID")
        {
            Clustered = true;
        }
    }
}