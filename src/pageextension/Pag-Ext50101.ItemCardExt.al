pageextension 50101 ItemCardExt extends "Item Card"
{

    actions
    {
        addafter(Functions)
        {
            fileuploadaction(ImportMultiplePictures)
            {
                ApplicationArea = all;
                Image = Picture;
                AllowMultipleFiles = true;

                // AllowedFileExtensions = '.pdf';
                trigger OnAction(Files: List of [FileUpload])
                var
                    CurrentFile: FileUpload;
                    InsStr: InStream;
                    FileName: Text;
                    FileMgt: Codeunit "File Management";
                    ItemRec: Record Item;
                begin
                    // Clear(FileName);
                    // foreach CurrentFile in Files do begin
                    //     CurrentFile.CreateInStream(InsStr, TextEncoding::MSDos);
                    //     FileName := FileMgt.GetFileNameWithoutExtension(CurrentFile.FileName);
                    //     if ItemRec.Get(Rec."No.") then begin
                    //         ItemRec.Picture.ImportStream(InsStr, 'Demo picture for item' + Format(ItemRec."No."));
                    //         ItemRec.Modify();
                    //     end;
                    // end;
                    Clear(FileName);
                    foreach CurrentFile in Files do begin
                        CurrentFile.CreateInStream(InsStr, TextEncoding::MSDos);
                        Rec.Picture.ImportStream(InsStr, CurrentFile.FileName);
                        Rec.Modify(true);
                    end;
                end;
            }
            action("Say Hello")
            {
                ApplicationArea = all;
                Image = OneNoteHelp;
                trigger OnAction()
                begin
                    Message('Hello');
                end;
            }
        }

        addafter(CopyItem_Promoted)
        {
            group(SplitButtonRef)
            {
                ShowAs = SplitButton;
                actionref(ImportMultiplePicturesPromoted; ImportMultiplePictures)
                { }
                actionref(Sayhello; "Say Hello") { }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Clear(ID);
        ID := Rec.Picture.MediaId;
    end;

    var
        ID: Guid;
}

