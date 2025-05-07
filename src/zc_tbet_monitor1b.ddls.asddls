@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity zc_tbet_monitor1b as select from ZR_TBET_MONITOR1
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
