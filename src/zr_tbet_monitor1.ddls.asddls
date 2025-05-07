@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TBET_MONITOR1
  as select from ZTBET_MONITOR1
{
  key bukrs as Bukrs,
  key belnr as Belnr,
  key gjahr as Gjahr,
  approvalstatus as Approvalstatus,
  s4status as S4status,
  tisstatus as Tisstatus,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed as LastChanged
  
}
