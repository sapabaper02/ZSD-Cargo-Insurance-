@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material & Customer Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CargoMatDescription
  as select distinct from ZI_Cargo_UniqueDocNum      as Item
    left outer join       I_BillingDocumentItemBasic as BillingItem on  Item.BillingDocument = BillingItem.BillingDocument
                                                                    and Item.item            = BillingItem.BillingDocumentItem

{
  key  BillingItem.BillingDocument,
  key  BillingItem.BillingDocumentItem                                 as item,
       BillingItem.BillingDocumentItemText                             as DescriptionOfCargo,
       BillingItem._Plant._StandardOrganizationAddress.CityName        as from_Address,
       BillingItem._BillToParty._AddressDefaultRepresentation.CityName as To_Address
}
