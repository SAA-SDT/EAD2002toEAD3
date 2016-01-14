EAD2002toEAD3
=============

XSLT 2.0 Transformation to convert EAD2002 instances to EAD3

## To Run

## Parameters

* **outputUndeprecatedEAD3**
  * values: true() | false()
  * default: false()
* **addMigrationComments**
  * values: true() | false()
  * default: true()
* **addMigrationMessages**
  * values: true() | false()
  * default: true()
* **maintenancestatusValue**: supplies value for /ead/control/maintenancestatus
  * values: revised | deleted | new | deletedsplit | deletedmerged | deletedreplaced | cancelled | derived
  * default: revised
* **publicationstatusValue**: supplies value for /ead/control/publicationstatus
  * inprocess, approved, published
  * default: NONE
* **agencynameValue**: supplies value for /ead/control/maintenanceagency/agencyname
  * value: SUPPLIED BY USER
  * default: NONE
* **eventtypeValue**: supplies value for /ead/control/maintenancehistory/maintenanceevent/eventtype
  * values: created | revised | deleted | cancelled | derived | updated | unknown
  * default: updated
* **agenttypeValue**: supplies value for /ead/control/maintenancehistory/maintenanceevent/agenttype
  * values: human | machine | unknown
  * default: machine
* **agent**: supplies value for /ead/control/maintenancehistory/maintenanceevent/agent
  * value: Default Value or Value Supplied by User
  * default: 'EAD 2002 to EAD3 Migration Style Sheet(EAD2002ToEAD3.xsl'

## Known Issues
