pageextension 50161 "Item List Ext" extends "Item List"
{
    actions
    {
        addafter(AdjustInventory)
        {
            action(SaveQueryAsJson)
            {
                ApplicationArea = All;
                Caption = 'Save Query As Json';
                Image = Download;
                trigger OnAction()
                begin
                    this.SaveQueryAsJson();
                end;
            }
        }
        addLast(Promoted)
        {
            actionref(SaveQueryAsJsonRef; SaveQueryAsJson) { }
        }

    }

    procedure SaveQueryAsJson();
    var
        OutS: OutStream;
        InS: InStream;
        TempBlob: Codeunit "Temp Blob";
        FileName: Text[250];
    begin
        TempBlob.CreateOutStream(OutS);
        if Query.SaveAsJson(Query::"PO Query", OutS) then begin
            FileName := 'POQuery.json';
            TempBlob.CreateInStream(InS);
            DownloadFromStream(InS, '', '', '', FileName);
        end;
    end;



}
