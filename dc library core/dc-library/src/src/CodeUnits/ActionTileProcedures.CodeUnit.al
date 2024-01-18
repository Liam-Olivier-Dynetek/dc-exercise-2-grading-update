codeunit 50700 ActionTileProcedures
{
    trigger OnRun()
    begin
        
    end;
    
    //Get UserID
    procedure GetCurrentUserDetails();
var
    CurrentUserID: Text[50];
begin
    CurrentUserID := USERID;
end;

    

}