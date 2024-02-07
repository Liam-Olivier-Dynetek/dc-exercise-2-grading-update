permissionset 50700 Librarian
{
    Assignable = true;
    Permissions = tabledata "Book Orders Table"=RIMD,
        tabledata "Book Series Table"=RIMD,
        tabledata "Library Table"=RIMD,
        table "Book Orders Table"=X,
        table "Book Series Table"=X,
        table "Library Table"=X,
        page "Add Sequel Book"=X,
        page "Book Details"=X,
        page "Book Orders Page"=X,
        page CreateOrder=X,
        page "Library List"=X;
}