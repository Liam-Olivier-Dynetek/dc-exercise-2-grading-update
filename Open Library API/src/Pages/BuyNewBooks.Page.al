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
            action("Get Books From API")
            {
                ApplicationArea = All;
                Caption = 'Get Books From API';
                ToolTip = 'Gets books by title.';
                Image = InsertFromCheckJournal;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    TempOpenLibrary: Record "Temp Library";
                    OpenLibraryBookRequests: Codeunit "Open Library Book Requests";
                    // TemPLibrary: Page "Open Library Temp";
                    ResponseText: Text;
                begin
                    ResponseText := OpenLibraryBookRequests.GetBooksByTitle(Title);
                    OpenLibraryBookRequests.ProcessJsonArray(ResponseText, TempOpenLibrary);

                    if TempOpenLibrary.FindFirst() then begin
                        PAGE.RUN(PAGE::"Open Library Temp", TempOpenLibrary);
                        // TemPLibrary.Update(true);
                        // CurrPage.Update(true);
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