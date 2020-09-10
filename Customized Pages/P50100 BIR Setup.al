page 50100 "BIR Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "BIR Setup";

    layout
    {
        area(Content)
        {
            group("BIR Registration Details")
            {
                field("BIR Permit No."; "BIR Permit No.")
                {
                    ApplicationArea = All;
                }
                field("BIR Date Issued"; "BIR Date Issued")
                {
                    ApplicationArea = All;
                }
                field("RDO Code"; "RDO Code")
                {
                    ApplicationArea = All;
                }
                field("Line of Business"; "Line of Business")
                {
                    ApplicationArea = All;
                }
                field("BIR Serial No."; "BIR Serial No.")
                {
                    ApplicationArea = All;
                }
                field("VAT Registration No."; "VAT Registration No.")
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