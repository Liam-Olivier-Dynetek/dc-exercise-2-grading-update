page 50855 "Temp Authors"
{
    PageType = List;
    SourceTable = "Temp Authors";
    UsageCategory = None;
    ApplicationArea = All;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Temp Auth No."; Rec."Temp Auth No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Temp Author No. field.';
                }
                
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Birth Date field.';
                }
                field(Top_Subjects; Rec.Top_Subjects)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Top_Subjects field.';
                }
                field(Top_Work; Rec.Top_Work)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Top_Work field.';
                }
                field("Work Count"; Rec."Work Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Work Count field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Add to Library")
            {
                ApplicationArea = All;
                Image = InsertFromCheckJournal;
                ToolTip = 'Add Authors From Open Library to Authors Table.';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    TransferAuthors: Codeunit "Transfer Authors";
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    if Rec.FindSet() then
                    repeat
                    TransferAuthors.AddToAuthors();
                    until Rec.Next() = 0;
                    Message('Authors Added to Authors List.');
                end;
            }
        }
    }
    trigger OnClosePage()
    begin
        Rec.DeleteAll(true);
    end;
}
