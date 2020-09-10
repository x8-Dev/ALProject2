table 50100 "BIR Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "BIR Permit No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "BIR Date Issued"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "RDO Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Line of Business"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "BIR Serial No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "VAT Registration No."; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(8; "VAT Registration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "WHT Registration ID"; Text[30])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}