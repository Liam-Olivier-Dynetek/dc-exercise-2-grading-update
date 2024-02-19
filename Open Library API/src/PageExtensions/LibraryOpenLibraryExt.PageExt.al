pageextension 50850 "Library Open Library Ext" extends "Library List"
{
    layout
    {
        addafter("Due Date")
        {

            field(FirstPublishYear; Rec.FirstPublishYear)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the FirstPublishYear field.';
                Caption = 'First Year Published';
            }
        }
    }
    actions
    {
        addafter("New Releases")
        {
            action("Buy New Books")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                end;
            }
        }
    }
}