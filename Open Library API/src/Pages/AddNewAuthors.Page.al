page 50854 "Add New Authors"
{
    PageType = List;
    SourceTable = "Temp Authors";
    UsageCategory = Administration;
    ApplicationArea = All;
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(Request)
            {
                
                field("Author Name"; "Author Key")
                {
                    ToolTip = 'Specifies the value of the Author Name field.';
                    Caption = 'Author Key';
                    Editable = True;
                }

            }
            group(Results)
            {
                part(OpenLibraryResults; "Temp Authors")
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
            action("Get Authors From API")
            {
                ApplicationArea = All;
                Caption = 'Get Authors From API';
                ToolTip = 'Gets Authors by Name.';
                Image = NewCustomer;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                
                trigger OnAction()
                var
                    TempOpenAuthors: Record "Temp Authors";
                    OpenLibraryAuthorRequests: Codeunit "Open Library Author Requests";
                    ResponseText: Text;
                begin
                    ResponseText := OpenLibraryAuthorRequests.GetAuthorsByKey("Author Key");
                    OpenLibraryAuthorRequests.ProcessJson(ResponseText, TempOpenAuthors);

                    if TempOpenAuthors.FindFirst() then begin
                        PAGE.RUN(PAGE::"Temp Authors", TempOpenAuthors);
                    end else begin
                        Message('No books found with the given title.');
                    end;
                end;
            }
        }
    }
    var
    "Author Key": Text;
}