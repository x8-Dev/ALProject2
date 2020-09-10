page 50103 "CSV Import"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSV Import";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;
                }

                field(Site; Site)
                {
                    ApplicationArea = All;
                }

                field(Customer; Customer)
                {
                    ApplicationArea = All;
                }

                field("Data Division"; "Data Division")
                {
                    ApplicationArea = All;
                }

                field("Order Request No."; "Order Request No.")
                {
                    ApplicationArea = All;
                }

                field("Cust Order Class2"; "Cust Order Class2")
                {
                    ApplicationArea = All;
                }

                field("Export Inv. No."; "Export Inv. No.")
                {
                    ApplicationArea = All;
                }

                field("Contract Store Code"; "Contract Store Code")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}