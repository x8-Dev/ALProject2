table 50101 "Ventilation Summary"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Production Order"."No.";
        }
        field(3; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
        field(4; "Work Center No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Work Center"."No." WHERE("No." = FIELD("Work Center No."));
        }
        field(5; "Actual Start"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Actual Finish"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Operator No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Operator Name"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Employee Id"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Worker Name"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Vent Area"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Working Time"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Overtime"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Work Month"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Order Request No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "No. Series"; Code[20])
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
        recManufacturingSetup: Record "Manufacturing Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        recManufacturingSetup.FINDFIRST;
        NoSeriesMgt.InitSeries(recManufacturingSetup."Ventilation Nos", xRec."No. Series", TODAY, "Entry No.", "No. Series");
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