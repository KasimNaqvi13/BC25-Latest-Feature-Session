pageextension 50102 "Item Picture Ext" extends "Item Picture"
{
    layout
    {
    }

    actions
    {
        addafter(ImportPicture)
        {
            action(Next)
            {
                ApplicationArea = all;
                Image = NextRecord;
                trigger OnAction()
                begin
                    if Rec.Picture.Count <= 0 then
                        exit;
                    Counting += 1;
                    // Rec.Picture := Format(Rec.Picture.Item(1));
                end;
            }

            action(PreviousImage)
            {
                ApplicationArea = all;
                Image = PreviousRecord;
                trigger OnAction()
                begin
                    if Rec.Picture.Count <= 0 then
                        exit;

                    Counting -= 1;

                end;
            }


        }
    }

    var
        MediaSetRec: Record "Tenant Media Set";
        Counting: Integer;


    trigger OnOpenPage()
    begin
        Clear(Counting);
    end;
}