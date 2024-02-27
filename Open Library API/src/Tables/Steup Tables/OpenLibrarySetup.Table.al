table 50850 "Open Library Setup"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
            NotBlank = true;
        }
        field(50850; "OP-LIB No."; Code[20])
        {
            TableRelation = "AAT API"."No.";
        }
        field(50855; "Author No."; Code[20])
        {
            TableRelation = "AAT API"."No.";

        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Get();
        RecordHasBeenRead := true;
    end;

    procedure InsertIfNotExists()
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert(true);
        end;
    end;


}