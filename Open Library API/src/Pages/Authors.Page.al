page 50853 "Authors"
{
    Caption = 'Authors';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Authors;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Author No."; Rec."Author No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Author No. field.';
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
                field("Work Count"; Rec."Work Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Work Count field.';
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
            }
        }
    }
}
