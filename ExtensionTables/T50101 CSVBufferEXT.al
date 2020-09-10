tableextension 50101 CSVBufferEXT extends "CSV Buffer"
{
    fields
    {
        // Add changes to table fields here
    }

    procedure LoadData2(CSVFileName: Text; CSVFieldSeparator: Text[1])
    begin
        InitializeReader(CSVFileName, CSVFieldSeparator);
        ReadLines(0);
        StreamReader2.Close;
    end;


    var
        myInt: Integer;
        StreamReader2: DotNet StreamReader;
}