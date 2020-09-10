tableextension 50100 ManufacturingSetupEXT extends "Manufacturing Setup"
{

    fields
    {
        // Add changes to table fields here
        field(50100; "Ventilation Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    var
        myInt: Integer;
}