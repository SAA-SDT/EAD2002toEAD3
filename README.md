EAD2002toEAD3
=============

XSLT Transformation to convert EAD2002 instances to EAD3

## To Run

## Parameters

* outputUndeprecatedEAD3
  * values: true() | false()
  * default: false()
* addMigrationComments
  * values: true() | false()
  * default: true()
* addMigrationMessages
  * values: true() | false()
  * default: true()
* maintenancestatusValue
  * values: revised | deleted | new | deletedsplit | deletedmerged | deletedreplaced | cancelled | derived
  * default: revised
* publicationstatusValue
  * inprocess, approved, published
  * default: NONE
* agencynameValue
  * value: SUPPLIED BY USER
  * default: NONE
* eventtypeValue
  * values: created | revised | deleted | cancelled | derived | updated | unknown
  * default: updated
* agenttypeValue
  * values: human | machine | unknown
  * default: machine
* agent
  * value: Default Value or Value Supplied by User
  * default: 'EAD 2002 to EAD3 Migration Style Sheet(EAD2002ToEAD3.xsl'

## Known Issues
