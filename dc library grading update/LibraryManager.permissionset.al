permissionset 50750 "Library Manager"
{
    Assignable = true;
    Permissions = tabledata "Damaged Books"=RIMD,
        tabledata "Library General Setup"=RIMD,
        tabledata "Returned Books"=RIMD,
        table "Damaged Books"=X,
        table "Library General Setup"=X,
        table "Returned Books"=X,
        report "Overdue Books Report"=X,
        codeunit "Book Grading Check"=X,
        codeunit "Date Checks"=X,
        codeunit "Grade Books"=X,
        codeunit "Returned Books"=X,
        codeunit "Update Rent Status"=X,
        page "Damaged Books"=X,
        page "Grade Books"=X,
        page "Library General Setup"=X,
        page "Return Grading Page"=X,
        page "Returned Books"=X,
        query "Overdue Book Query"=X;
}