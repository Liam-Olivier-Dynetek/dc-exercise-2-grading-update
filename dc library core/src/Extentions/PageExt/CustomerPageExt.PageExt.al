pageextension 50700 "Customer Page Ext" extends "Customer List"
{
    layout
    {
        addafter(Contact)
        {
            field("Order Number";Rec."Order Number")
            {
                ToolTip = 'Shows the Order Number';
                Caption = 'Order Number';
                ApplicationArea = All;
            }
        }
    }
}