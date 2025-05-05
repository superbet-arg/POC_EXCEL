@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_TBET_UPL_FILE1
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TBET_UPL_FILE1
{
  key IdUpload,
  Attachment,
  Mimetype,
  Filename,
  Status,
  ErrorLog,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChanged,
  
    _fileres : redirected to composition child ZC_TBET_FILE_RES1
}
