@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_TBET_MONITOR1
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TBET_MONITOR1
{
  key Bukrs,
  key Belnr,
  key Gjahr,
  Approvalstatus,
  S4status,
  Tisstatus,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChanged
  
}
