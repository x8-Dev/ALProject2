page 50102 "Ventilation Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Ventilation Summary";

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
                field("Order No."; "Order No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                }
                field("Work Center No."; "Work Center No.")
                {
                    ApplicationArea = All;
                }
                field("Actual Start"; "Actual Start")
                {
                    ApplicationArea = All;
                }
                field("Actual Finish"; "Actual Finish")
                {
                    ApplicationArea = All;
                }
                field("Operator No."; "Operator No.")
                {
                    ApplicationArea = All;
                }
                field("Operator Name"; "Operator Name")
                {
                    ApplicationArea = All;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = All;
                }
                field("Employee Id"; "Employee Id")
                {
                    ApplicationArea = All;
                }
                field("Worker Name"; "Worker Name")
                {
                    ApplicationArea = All;
                }
                field("Vent Area"; "Vent Area")
                {
                    ApplicationArea = All;
                }
                field("Working Time"; "Working Time")
                {
                    ApplicationArea = All;
                }
                field(Overtime; Overtime)
                {
                    ApplicationArea = All;
                }
                field("Work Month"; "Work Month")
                {
                    ApplicationArea = All;
                }
                field("Order Request No."; "Order Request No.")
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