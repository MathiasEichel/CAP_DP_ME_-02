using me.orders as my from '../db/schema.cds';
using { OP_API_PRODUCT_SRV_0001 as ext } from './external/OP_API_PRODUCT_SRV_0001.csn';

service CatalogService {

  @readonly entity Products as projection on ext.A_Product
    { 
      key Product as productID,
      Division,
      ItemCategoryGroup
    };
    @readonly entity Plants as projection on my.Plants
     {
       key salesOrg as salesOrg,
       plantId,
       matTyp
     }
      entity Orders as select from my.Orders mixin {
        product: Association to Products
          on product.productID = productID;
        plant: Association to Plants
            on plant.salesOrg = salesOrg
      } into {
        *,
        product.Division, product.ItemCategoryGroup, plant.plantId
      }
}