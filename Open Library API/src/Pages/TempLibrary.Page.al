page 50852 "Open Library Temp"
{
    PageType = List;
    SourceTable = "Temp Library";
    UsageCategory = None;
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
                field("Cover Image"; Rec."Cover Image")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cover Image field.';
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
                    TempAuthors: Record "Temp Authors";
                    TransferBooks: Codeunit "Transfer Books";
                    OpenLibraryAuthorRequests: Codeunit "Open Library Author Requests";
                    // OpenLibraryImageRequests: Codeunit "Open Library Image Requests";
                    TransferAuthors: Codeunit "Transfer Authors";
                    ResponseText: Text;
                    // CoverKey: Text;
                    // CoverImage: InStream;
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    if Rec.FindSet() then
                        repeat
                            //Add Book Covers to books.
                            // CoverKey := Rec.CoverKey;
                            // CoverImage := OpenLibraryImageRequests.GetBookCovers(CoverKey);
                            //Add Books To Library
                            TransferBooks.AddToLibrary();
                            //Add Authors To Author List
                            ResponseText := OpenLibraryAuthorRequests.GetAuthorsByKey(Rec.Author_Key);
                            OpenLibraryAuthorRequests.ProcessJson(ResponseText, TempAuthors);
                            TransferAuthors.AddToAuthors();
                        until Rec.Next() = 0;
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
