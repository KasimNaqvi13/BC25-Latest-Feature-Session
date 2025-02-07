profile BusinessManager
{
    Caption = 'Business Manager Custom';
    Description = 'Profile Display Business Manager';
    RoleCenter = "Business Manager Role Center";
    Customizations = CustomCustomization;
}
pagecustomization CustomCustomization customizes "Item Card"
{
    ClearActions = true;
    ClearLayout = true;
    // ClearViews = true; // only able to use in list pages 
    layout
    {
        modify("No.") { Visible = true; }
        modify(Description) { Visible = true; }
    }
}