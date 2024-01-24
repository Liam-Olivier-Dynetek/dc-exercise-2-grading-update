codeunit 50753 "Returned Books"
{
    trigger OnRun()
    begin
        
    end;
    
    procedure ReturnedBookRecord(OrderID: Code[20]; CustomerID: Code[20]; CustomerName: Text[50]; BookTitle: Text[50])
var
    ReturnedBook: Record "Returned Books";
begin
    ReturnedBook.Init();
    ReturnedBook."Order ID" := OrderID;
    ReturnedBook."Customer ID" := CustomerID;
    ReturnedBook."Customer Name" := CustomerName;
    ReturnedBook."Book Title" := BookTitle;
    ReturnedBook."Return Date" := Today();

    if not ReturnedBook.Insert() then
        Error('Failed to insert record.');
end;
}