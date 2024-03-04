pageextension 50851 "Role Center Open Library" extends "Role Page"
{
    actions
    {
        addafter("Add New Book")
        {
            action("Get New Books")
            {
                Caption = 'Request Books From API';
                Image = InsertFromCheckJournal;
                ApplicationArea = All;
                RunObject = Page "Add New Books";

            }
            action("Get Authors")
            {
                Caption = 'Request Authors From API';
                Image = InsertFromCheckJournal;
                ApplicationArea = All;
                RunObject = Page "Add New Authors";
            }
        }
    }

}
