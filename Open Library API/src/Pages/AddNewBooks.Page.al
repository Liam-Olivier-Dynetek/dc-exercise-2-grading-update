page 50850 "Add New Books"
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
                    ResponseText: Text;
                begin
                    ResponseText := OpenLibraryBookRequests.GetBooksByTitle(Title);
                    OpenLibraryBookRequests.ProcessJsonArray(ResponseText, TempOpenLibrary);
                    
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