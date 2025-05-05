@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_TBET_FILE_RES1
  as projection on ZR_TBET_FILE_RES1
{
  key IdUpload,
  key Bukrs,
  key Belnr,
  key Gjahr,
  key Buzei,
  Blart,
  Bldat,
  Usnam,
  Kostl,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChanged,
  
    _file : redirected to parent ZC_TBET_UPL_FILE1
  
}
