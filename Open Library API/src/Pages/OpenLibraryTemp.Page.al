page 50852 "Open Library Temp"
{
    PageType = List;
    SourceTable = "Temp Library";
    UsageCategory = Administration;
    ApplicationArea = All;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Temp id"; Rec."Temp id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Temp id field.';
                }

                field("Title"; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field("Author"; Rec.Author)
                {
                    ApplicationArea = All;
                }
                field(Pages; Rec.Pages)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pages field.';
                }

            }
        }
    }

    var
        Title: Text;
        Author: text;


    trigger OnClosePage()
    begin
        Rec.DeleteAll(true);
    end;
}
