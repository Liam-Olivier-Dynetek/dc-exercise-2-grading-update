page 50852 "Open Library Temp"
{
    PageType = List;
    SourceTable = "Library Table";
    UsageCategory = Administration;
    ApplicationArea = All;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Title"; Title)
                {
                    ApplicationArea = All;
                }
                field("Author"; Author)
                {
                    ApplicationArea = All;
                }
                field("First Publish Year"; FirstPublishYear)
                {
                    ApplicationArea = All;
                }
            }
        }
    }


var 
Title: Text;
Author: text;
FirstPublishYear: Integer;

}
