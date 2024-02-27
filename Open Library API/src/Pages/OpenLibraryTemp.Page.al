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
                field(Publisher; Rec.Publisher)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Publiher value.';
                }
                field(ISBN; Rec.ISBN)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ISBN value.';
                }
                field(FistPublishYear; Rec.FistPublishYear)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the FistPublishYear field.';
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
                ToolTip = 'Add Books From Open Library to Main Library.';
                trigger OnAction()
                var
                    TransferBooks: Codeunit "Transfer Books";
                begin
                    TransferBooks.AddToLibrary();
                    Message('Books Added to Library.');
                end;
            }
        }
    }
    trigger OnClosePage()
    begin
        Rec.DeleteAll(true);
    end;
}
