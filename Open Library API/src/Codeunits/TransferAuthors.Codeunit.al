codeunit 50852 "Transfer Authors"
{
    procedure AddToAuthors()
    var
        TempAuthor: Record "Temp Authors";
        Author: Record Authors;
    begin
        if TempAuthor.FindSet() then
            repeat
                Author.Init();
                Author.Name := TempAuthor.Name;
                Author."Birth Date" := TempAuthor."Birth Date";
                Author.Top_Work := TempAuthor.Top_Work;
                Author."Work Count" := TempAuthor."Work Count";
                Author.Top_Subjects := TempAuthor.Top_Subjects;
                Author.Insert(true);
            until TempAuthor.Next() = 0;
    end;
}