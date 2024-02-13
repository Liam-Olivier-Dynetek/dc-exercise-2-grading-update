permissionset 50751 Dashboard
{
    Assignable = true;
    Permissions = tabledata "Damaged Books"=RIMD,
        tabledata Dashboard=RIMD,
        tabledata "Library General Setup"=RIMD,
        tabledata "Returned Books"=RIMD,
        table "Damaged Books"=X,
        table Dashboard=X,
        table "Library General Setup"=X,
        table "Returned Books"=X,
        report "Overdue Books Report"=X,
        codeunit "Book Grading Check"=X,
        codeunit "Date Checks"=X,
        codeunit "Grade Books"=X,
        codeunit "Returned Books"=X,
        codeunit "Update Rent Status"=X,
        page "Damaged Books"=X,
        page "Dash Board"=X,
        page "Grade Books"=X,
        page "Headline Librarian"=X,
        page "Library General Setup"=X,
        page "Return Grading Page"=X,
        page "Returned Books"=X,
        page "Role Page"=X,
        page "New Releases Cue"=X,
        query "Overdue Book Query"=X;
}