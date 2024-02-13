page 50760 "Dash Board"
{
    PageType = Card;
    Caption = 'DashBoard';
    SourceTable = Dashboard;
    SourceTableTemporary = true;


    layout
    {
        area(Content)
        {
            group(Filters)
            {
                field(Author; AuthorName)
                {
                    Caption = 'Author Name';
                    ToolTip = 'Specifies the value of the AuthorName field.';
                    ApplicationArea = All;
                    Editable = true;

                    trigger OnValidate();
                    begin
                        Rec."Author Filter" := AuthorName;
                        Rec.UpdateCounts();
                        CurrPage.Update();
                    end;
                }
                field(Genre; Genre)
                {
                    Caption = 'Genre';
                    ToolTip = 'Specifies the value of the Genre field.';
                    ApplicationArea = All;
                    Editable = true;

                    trigger OnValidate();
                    begin
                        Rec."Genre Filter" := Genre;
                        Rec.UpdateCounts();
                        CurrPage.Update();
                    end;
                }
                field("Release Date"; ReleaseDate)
                {
                    Caption = 'Release Date';
                    ToolTip = 'Specifies the value of the Release-date field.';
                    ApplicationArea = All;
                    Editable = true;

                    trigger OnValidate();
                    begin
                        Rec."Date Filter" := ReleaseDate;
                        Rec.UpdateCounts();
                        CurrPage.Update();
                    end;
                }

            }
            group(Overview)
            {

                field("Available Books"; Rec."Available Books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Available Books field.';
                }
                field("Damaged Books"; Rec."Damaged Books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Damaged Books field.';
                }
                field("New Books"; Rec."New Books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Books field.';
                }
                field("Rented Books"; Rec."Rented Books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rented Books field.';
                }
                field("Unique Books"; Rec."Unique Books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unique Books field.';
                }
            }
        }
    }

    // trigger OnOpenPage()
    // begin
    //     Rec.CheckFiltersEmpty();
    // end;


    var
        AuthorName: Text[50];
        Genre: Text[50];
        ReleaseDate: Date;

}