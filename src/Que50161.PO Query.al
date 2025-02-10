query 50161 "PO Query"
{
    Caption = 'ZY Purchase Order Query';
    OrderBy = Descending(Buy_from_Vendor_No_);
    QueryCategory = 'Vendor List', 'Purchase Order List';

    elements
    {
        dataitem(Purchase_Header; "Purchase Header")
        {
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            {
            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {
            }
            column(Order_Date; "Order Date")
            {
            }
            column(Amount_Including_VAT; "Amount Including VAT")
            {
            }
            dataitem(Purchase_Line; "Purchase Line")
            {
                DataItemLink = "Document Type" = Purchase_Header."Document Type",
                "Document No." = Purchase_Header."No.";
                column(No_; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Amount; Amount)
                {
                }
                dataitem(Item; Item)
                {
                    DataItemLink = "No." = Purchase_Line."No.";
                    column(Inventory; Inventory)
                    {
                    }
                }
            }
        }
    }
}