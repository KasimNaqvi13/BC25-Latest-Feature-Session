pageextension 50103 "Item List Ext" extends "Item List"
{
    actions
    {
        addafter(Functions)
        {
            fileuploadaction(ImportMultiplePictures)
            {
                ApplicationArea = all;
                Image = Picture;
                Caption = 'Import multi picture for item';
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
                    Clear(FileName);
                    foreach CurrentFile in Files do begin
                        CurrentFile.CreateInStream(InsStr, TextEncoding::MSDos);
                        Rec.Picture.ImportStream(InsStr, CurrentFile.FileName + ' ' + Rec."No.");
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

            fileuploadaction(ImportMultipleItemPictures)
            {
                ApplicationArea = All;
                Caption = 'Import Multiple Item Pictures';
                Image = Import;
                AllowMultipleFiles = true;

                trigger OnAction(files: List of [FileUpload])
                var
                    CurrentFile: FileUpload;
                    InStr: InStream;
                    FileName: Text;
                    FileMgt: Codeunit "File Management";
                    Item: Record Item;
                begin
                    FileName := '';
                    foreach CurrentFile in Files do begin
                        CurrentFile.CreateInStream(InStr, TextEncoding::MSDos);
                        FileName := FileMgt.GetFileNameWithoutExtension(CurrentFile.FileName);
                        if Item.Get(FileName) then begin
                            Clear(Item.Picture);
                            Item.Picture.ImportStream(InStr, 'Demo picture for item ' + Format(Item."No."));
                            Item.Modify(true);
                        end;
                    end;
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

                actionref(ImportMultipleItemPictures_Promoted; ImportMultipleItemPictures)
                {
                }
            }
        }
    }
}
