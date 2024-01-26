table 50752 "Library General Setup"
{
    DataPerCompany = true;
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Library Nos."; Code[20])
        {
            Caption = 'Library Nos.';
            TableRelation = "No. Series";
        }
        field(3; "Damaged Books Nos."; Code[20])
        {
            Caption = 'Damaged Books Nos.';
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
