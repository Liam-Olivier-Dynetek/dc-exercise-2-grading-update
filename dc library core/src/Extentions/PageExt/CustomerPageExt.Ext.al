pageextension 50700 "Customer Page" extends "Customer List"
{
    layout
    {
        addafter(Contact)
        {
            field("Order Number";Rec."Order Number")
            {
                Caption = 'Order Number';
                ApplicationArea = All;
            }
        }
    }
}