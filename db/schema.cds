namespace me.orders;

using cuid from '@sap/cds/common';

entity Orders : cuid {
  orderNumber  : String;      // @title : 'Order Number'; //> readable key
  salesOrg  : String;
  posNumber    : String;
  productID    : String;
  quantity : Integer;
  unitCode: String;
  Division: String;
  ItemCategoryGroup: String;
  plantId: String;
}

entity Plants : cuid {
  salesOrg: String;
  plantId: String;
  matTyp: String
}
