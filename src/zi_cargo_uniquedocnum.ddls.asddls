@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cargo Unique Document No. for Mat Desc.'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_Cargo_UniqueDocNum
  as select from I_BillingDocumentItemBasic as BillingItem
{
  key  BillingItem.BillingDocument,
       min( BillingDocumentItem ) as item
}
group by
  BillingItem.BillingDocument
