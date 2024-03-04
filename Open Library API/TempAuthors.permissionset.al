permissionset 50853 TempAuthors
{
    Assignable = true;
    Permissions = tabledata Authors=RIMD,
        tabledata "Open Library Setup"=RIMD,
        tabledata "Temp Authors"=RIMD,
        tabledata "Temp Library"=RIMD,
        table Authors=X,
        table "Open Library Setup"=X,
        table "Temp Authors"=X,
        table "Temp Library"=X,
        codeunit "Open Library Book Requests"=X,
        codeunit "Transfer Books"=X,
        page "Add New Books"=X,
        page "Open Library Setup"=X,
        page "Open Library Temp"=X;
}