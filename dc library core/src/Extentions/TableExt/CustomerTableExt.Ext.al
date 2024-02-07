tableextension 50700 "Customer Table Ext" extends Customer
{
    fields
    {
        field(50711; "Order Number"; Integer)
        {
            Caption = 'Order ID';
            DataClassification = CustomerContent;
            Editable = true;
        }
    }
    
}