codeunit 50101 "Item Management"
{
    [EventSubscriber(ObjectType::Table, Database::Item, OnAfterDeleteEvent, '', false, false)]
    local procedure OnAfterDeleteItem(var Rec: Record Item)
    var
        MediaOrphan: List of [Guid];
        MediaID: Guid;
        MediaTenantRec: Record "Tenant Media Set";
    begin

        MediaOrphan := MediaSet.FindOrphans();
        foreach MediaID in MediaOrphan do begin
            if MediaTenantRec.Get(MediaID) then
                MediaTenantRec.Delete(true);
        end;
    end;
}
