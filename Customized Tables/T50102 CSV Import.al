table 50102 "CSV Import"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; Site; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Customer"; Code[10])
        {
            DataClassification = ToBeClassified;
        }

        field(4; "Data Division"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(5; "Order Request No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }

        field(6; "Cust Order Class2"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(7; "Export Inv. No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }

        field(8; "Contract Store Code"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(9; "Is Sales Order Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Sales Order No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Entry No.")
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