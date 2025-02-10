pageextension 50171 "Item Ext" extends "Item List"
{
    layout
    {
        modify(Description)
        {
            StyleExpr = StyleTxt;
        }
    }


    actions
    {
        addafter(AdjustInventory)
        {
            action(StandardAccent)
            {
                ApplicationArea = All;
                Caption = 'StandardAccent';
                Image = Change;
                trigger OnAction()
                begin
                    this.PageStyleExpression(PageStyle::StandardAccent);
                end;
            }
            action(Strong)
            {
                ApplicationArea = All;
                Caption = 'Strong';
                Image = Change;
                trigger OnAction()
                begin
                    this.PageStyleExpression(PageStyle::Strong);
                end;
            }
            action(Favorable)
            {
                ApplicationArea = All;
                Caption = 'Favorable';
                Image = Change;
                trigger OnAction()
                begin
                    this.PageStyleExpression(PageStyle::Favorable);
                end;
            }
            action(Ambiguous)
            {
                ApplicationArea = All;
                Caption = 'Ambiguous';
                Image = Change;
                trigger OnAction()
                begin
                    this.PageStyleExpression(PageStyle::Ambiguous);
                end;
            }
        }


        addlast(Promoted)
        {
            actionref(StandardAccentRef; StandardAccent) { }
            actionref(Favorableref; Favorable) { }
            actionref(Ambiguousref; Ambiguous) { }
            actionref(Strongref; Strong) { }
        }


    }
    var
        StyleTxt: Text;




    local procedure PageStyleExpression(PageSty: PageStyle)
    begin
        StyleTxt := Format(PageSty);
    end;


}
