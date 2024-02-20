page 50850 "Buy New Books"
{
    Caption = 'Book Store';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
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
                trigger OnAction()
                var
                    OpenLibraryAPIRequests: Codeunit "Open Library API Requests";
                    Books: Text;
                begin
                    Books := OpenLibraryAPIRequests.GetBooksByTitle(Title);
                    if Books <> '' then begin
                        Message('Are you sure you want to add this to the library?');
                        OpenLibraryAPIRequests.InsertBooksIntoLibrary(Title);
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