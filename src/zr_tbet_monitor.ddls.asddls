@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Monitor'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZR_TBET_MONITOR as select from zbet_monitor
{
    key bukrs as Bukrs,
    key belnr as Belnr,
    key gjahr as Gjahr,
    approvalstatus as Approvalstatus,
    s4status as S4status,
    tisstatus as Tisstatus,
    local_created_by as LocalCreatedBy,
    local_created_at as LocalCreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed as LastChanged
}
