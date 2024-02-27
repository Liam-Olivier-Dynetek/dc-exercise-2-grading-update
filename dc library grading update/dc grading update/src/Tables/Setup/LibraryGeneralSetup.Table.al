table 50752 "Library General Setup"
{
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Library Nos."; Code[20])
        {
            Caption = 'Library Nos.';
            TableRelation = "No. Series".Code;
        }
        field(3; "Damaged Books Nos."; Code[20])
        {
            Caption = 'Damaged Books Nos.';
            TableRelation = "No. Series".Code;
        }
        field(4; "Temporary Book Nos."; Code[20])
        {
            Caption = 'Temporary Books Nos.';
            TableRelation = "No. Series".Code;
        }
        field(5; "Temporary Author Nos."; Code[20])
        {
            Caption = 'Temporary Author Nos.';
            TableRelation = "No. Series".Code;
        }
        field(6; "Author Nos."; Code[20])
        {
            Caption = 'Authors Nos.';
            TableRelation = "No. Series".Code;
        }
        
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

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

    var
        RecordHasBeenRead: Boolean;
}
