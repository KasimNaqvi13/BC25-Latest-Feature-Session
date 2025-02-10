page 50151 "Resources in extensions"
{
    ApplicationArea = All;
    Caption = 'Resources in extensions';
    PageType = List;
    UsageCategory = History;

    layout
    {
        area(Content)
        {
        }
    }

    actions
    {
        area(Processing)
        {
            action("Resources in extensions")
            {
                trigger OnAction()
                var
                    Text001: Text;
                begin
                    Text001 := NavApp.GetResourceAsText('ResourceText.txt', TextEncoding::UTF8);
                    Message(Text001);
                end;
            }
        }

        area(Promoted)
        {
            actionref("Resources in extensionsRef"; "Resources in extensions")
            {

            }
        }
    }
}
