pageextension 50101 ManufacturingSetupEXT extends "Manufacturing Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Planned Order Nos.")
        {
            field("Ventilation Nos"; "Ventilation Nos")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}