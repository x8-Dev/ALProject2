report 50100 "CSV Import"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                    field(ImportOption; ImportOption)
                    {
                        ApplicationArea = All;
                        //FieldPropertyName = FieldPropertyValue;
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }

        trigger OnQueryClosePage(CloseAction: Action): Boolean
        var
            myInt: Integer;
        begin
            IF CloseAction = ACTION::OK THEN BEGIN
                //ServerFileName := FileMgt.UploadFile('Nice', '.csv');
                IF ServerFileName = '' THEN
                    EXIT(FALSE);
            END;
        end;
    }


    trigger OnPreReport()
    begin
        TempCSVBuffer.DELETEALL;
        //TempCSVBuffer.LoadData(ServerFileName, ',');
        //TempCSVBuffer.LoadDataFromStream(ServerFileName, ',');
        Window.OPEN('Inserting Lines    @1@@@@@@@@@@@@@');
        TempCSVBuffer.FINDLAST;
        intcounter := TempCSVBuffer."Line No.";
        FOR X := 2 TO intcounter DO BEGIN
            TempCSVBuffer.RESET;
            TempCSVBuffer.SETRANGE("Line No.", X);
            IF TempCSVBuffer.FINDFIRST THEN BEGIN
                REPEAT
                UNTIL TempCSVBuffer.NEXT = 0;
            END;
            recScrumSO3.RESET;
            recScrumSO3.SETRANGE("Order Request No.", TempCSVBuffer.GetValue(X, 4));
            IF recScrumSO3.FINDFIRST THEN BEGIN
                IF (recScrumSO3."Is Sales Order Created" = TRUE) OR (recScrumSO3."Sales Order No." <> '') THEN BEGIN
                    MESSAGE('%1 cannot be imported due to existing Sales Order', TempCSVBuffer.GetValue(X, 4));
                END ELSE BEGIN
                    ModifyScrumIntoBC;
                END;
            END ELSE BEGIN
                InsertScrumIntoBC;
            END;
        END;
        IF totalimport <> 0 THEN BEGIN
            MESSAGE('Import Completed, Total of Imported Data : %1', X);
            Window.CLOSE;
        END;
    end;

    local procedure InsertScrumIntoBC()
    var
        myInt: Integer;
        recScrumSO: Record "CSV Import";
    begin
        GetLastEntryNo;
        recScrumSO.RESET;
        recScrumSO."Entry No." := LastEntryNo;
        recScrumSO.Site := TempCSVBuffer.GetValue(X, 1);
        recScrumSO.Customer := TempCSVBuffer.GetValue(X, 2);

        EVALUATE(recScrumSO."Data Division", TempCSVBuffer.GetValue(X, 3));
        recScrumSO.VALIDATE("Data Division", recScrumSO."Data Division");

        EVALUATE(recScrumSO."Order Request No.", TempCSVBuffer.GetValue(X, 4));
        recScrumSO.VALIDATE("Order Request No.", recScrumSO."Order Request No.");

        EVALUATE(recScrumSO."Cust Order Class2", TempCSVBuffer.GetValue(X, 5));
        recScrumSO.VALIDATE("Cust Order Class2", recScrumSO."Cust Order Class2");

        EVALUATE(recScrumSO."Export Inv. No.", TempCSVBuffer.GetValue(X, 6));
        recScrumSO.VALIDATE("Export Inv. No.", recScrumSO."Export Inv. No.");

        EVALUATE(recScrumSO."Contract Store Code", TempCSVBuffer.GetValue(X, 7));
        recScrumSO.VALIDATE("Contract Store Code", recScrumSO."Contract Store Code");

        recScrumSO.INSERT;
        totalimport := totalimport + 1;
    end;

    local procedure ModifyScrumIntoBC()
    var
        myInt: Integer;
        recScrumSO: Record "CSV Import";
    begin
        GetLastEntryNo;
        recScrumSO.RESET;
        recScrumSO.SETRANGE("Order Request No.", TempCSVBuffer.GetValue(X, 4));
        recScrumSO.SETRANGE("Is Sales Order Created", FALSE);
        recScrumSO.SETRANGE("Sales Order No.", '');
        IF recScrumSO.FINDFIRST THEN BEGIN
            //recScrumSO."Entry No." := LastEntryNo;
            recScrumSO.Site := TempCSVBuffer.GetValue(X, 1);
            recScrumSO.Customer := TempCSVBuffer.GetValue(X, 2);

            EVALUATE(recScrumSO."Data Division", TempCSVBuffer.GetValue(X, 3));
            recScrumSO.VALIDATE("Data Division", recScrumSO."Data Division");

            EVALUATE(recScrumSO."Order Request No.", TempCSVBuffer.GetValue(X, 4));
            recScrumSO.VALIDATE("Order Request No.", recScrumSO."Order Request No.");

            EVALUATE(recScrumSO."Cust Order Class2", TempCSVBuffer.GetValue(X, 5));
            recScrumSO.VALIDATE("Cust Order Class2", recScrumSO."Cust Order Class2");

            EVALUATE(recScrumSO."Export Inv. No.", TempCSVBuffer.GetValue(X, 6));
            recScrumSO.VALIDATE("Export Inv. No.", recScrumSO."Export Inv. No.");

            EVALUATE(recScrumSO."Contract Store Code", TempCSVBuffer.GetValue(X, 7));
            recScrumSO.VALIDATE("Contract Store Code", recScrumSO."Contract Store Code");

            recScrumSO.MODIFY;
            totalimport := totalimport + 1;
        END;
    end;

    local procedure GetLastEntryNo()
    var
        myInt: Integer;
        recScrumSO1: Record "CSV Import";
    begin
        IF recScrumSO1.ISEMPTY THEN BEGIN
            LastEntryNo := 10000;
        END ELSE BEGIN
            recScrumSO1.FINDLAST;
            LastEntryNo := recScrumSO1."Entry No." + 1;
        END;
    end;

    var
        myInt: Integer;
        FileMgt: Codeunit "File Management";
        TempCSVBuffer: Record "CSV Buffer";
        ServerFileName: Text;
        Window: Dialog;
        intcounter: Integer;
        X: Integer;
        recScrumSO3: Record "CSV Import";
        totalimport: Integer;
        LastEntryNo: Integer;
        ImportOption: Option;


}