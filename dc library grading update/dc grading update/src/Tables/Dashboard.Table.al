table 50754 Dashboard
{
    DataClassification = ToBeClassified;

    fields
    {
        field(50101; ID; Code[50])
        {
            Caption = 'ID';
        }
        //FlowFields
        field(50105; "Unique Books"; Integer)
        {
            Editable = false;
            CalcFormula = count("Library Table" where(Author = field("Author Filter")));
            FieldClass = FlowField;
        }
        field(50106; "New Books"; Integer)
        {
            Editable = false;
            CalcFormula = count("Library Table" where("Quality Rating" = const(A),
                                                        Author = field("Author Filter"),
                                                        Genre = field("Genre Filter"),
                                                        PublicationDate = field("Date Filter")
                                                        ));
            FieldClass = FlowField;
        }
        field(50107; "Damaged Books"; Integer)
        {
            Editable = false;
            CalcFormula = count("Library Table" where(Rented = const(Damaged),
                                                        Author = field("Author Filter"),
                                                        Genre = field("Genre Filter"),
                                                        PublicationDate = field("Date Filter")
                                                        ));
            FieldClass = FlowField;
        }
        field(50108; "Rented Books"; Integer)
        {
            Editable = false;
            CalcFormula = count("Library Table" where(Rented = const("Out of Store"),
                                                        Author = field("Author Filter"),
                                                        Genre = field("Genre Filter"),
                                                        PublicationDate = field("Date Filter")
                                                        ));
            FieldClass = FlowField;
        }
        field(50109; "Available Books"; Integer)
        {
            Editable = false;
            CalcFormula = count("Library Table" where(Rented = const(Available),
                                                        Author = field("Author Filter"),
                                                        Genre = field("Genre Filter"),
                                                        PublicationDate = field("Date Filter")
                                                        ));
            FieldClass = FlowField;
        }

        // FlowFilters
        field(50110; "Author Filter"; Text[50])
        {
            FieldClass = FlowFilter;
            InitValue = 'Rick Riordan';
        }
        field(50111; "Genre Filter"; Text[50])
        {
            FieldClass = FlowFilter;
            InitValue  = '';
        }
        field(50112; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
            InitValue = " ";
        }

    }

    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }

    procedure UpdateCounts()
    var
        LibraryTable: Record "Library Table";
    begin
        if "Author Filter" <> '' then
            LibraryTable.SetRange(Author, "Author Filter");
        if "Genre Filter" <> '' then
            LibraryTable.SetRange(Genre, "Genre Filter");
        if "Date Filter" <> 0D then
            LibraryTable.SetRange(PublicationDate, "Date Filter");

        "Unique Books" := LibraryTable.Count();
        LibraryTable.SetRange("Quality Rating", LibraryTable."Quality Rating"::A);
        "New Books" := LibraryTable.Count();
        LibraryTable.SetRange(Rented, LibraryTable.Rented::Available);
        "Damaged Books" := LibraryTable.Count();
        LibraryTable.SetRange(Rented, LibraryTable.Rented::Damaged);
        "Rented Books" := LibraryTable.Count();
        LibraryTable.SetRange(Rented, LibraryTable.Rented::"Out of Store");
        "Available Books" := LibraryTable.Count();
    end;

}