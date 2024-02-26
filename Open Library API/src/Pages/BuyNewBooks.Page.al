page 50850 "Buy New Books"
{
    Caption = 'Buy New Books';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Request)
            {
                field("Title"; Title)
                {
                    ToolTip = 'Specifies the value of the Title field.';
                    Caption = 'Title';
                    Editable = true;
                }

                field("Author Name"; "Author Name")
                {
                    ToolTip = 'Specifies the value of the Author Name field.';
                    Caption = 'Author Name';
                    Editable = false;
                }

                field("First Published Year"; "First Published Year")
                {
                    ToolTip = 'Specifies the value of the First Published Year field.';
                    Caption = 'First Published Year';
                    Editable = false;
                }
            }
            group(Results)
            {
                part(OpenLibraryResults; "Open Library Temp")
                {
                    Caption = 'Open Library Results';
                    ApplicationArea = ALL;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Add New Books To Library")
            {
                ApplicationArea = All;
                Caption = 'Add To Library';
                ToolTip = 'Gets books by title and allows them to be added to the';
                Image = InsertFromCheckJournal;
                Promoted = true;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    TempOpenLibrary: Record "Temp Library";
                    OpenLibraryAPIRequests: Codeunit "Open Library API Requests";
                    ResponseText: Text;
                begin
                    ResponseText := OpenLibraryAPIRequests.GetBooksByTitle(Title);
                    OpenLibraryAPIRequests.ProcessJsonArray(ResponseText, TempOpenLibrary);

                    if TempOpenLibrary.FindFirst() then begin
                        PAGE.RUN(PAGE::"Open Library Temp", TempOpenLibrary);
                    end else begin
                        Message('No books found with the given title.');
                    end;
                end;
            }
        }
    }

    var
        Title: Text;
        "Author Name": Text;
        "First Published Year": Integer;
}