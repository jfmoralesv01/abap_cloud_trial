@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Agency CDS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZJFMV_AGENCY as select from /dmo/agency
{
   key agency_id     as agency_id,
      name          as name,
      street        as street,
      postal_code   as postal_code,
      city          as city,
      country_code  as country_code,
      phone_number  as phone_number,
      email_address as email_address,
      web_address   as web_address
}
