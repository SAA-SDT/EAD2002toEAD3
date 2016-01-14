EAD2002toEAD3
=============

XSLT 2.0 Transformation to convert EAD2002 instances to EAD3

## Requirements

ead2002toEAD3.xsl is an XSLT 2.0 transformation and therefore requires an XSLT 2.0 capable processor. Any 9.x version of Saxon should work. The latest stable free of charge and open source and release of Saxon, Saxon-HE 9.6.0.8 (for Java), is available for download at: http://sourceforge.net/projects/saxon/files/Saxon-HE/9.6/SaxonHE9-6-0-8J.zip/download.

Saxon requires JDK 1.5 (Java 2 Platform, Standard Edition 5.0) or later

Full documentation for Saxon may be found at: http://www.saxonica.com/html/documentation9.6/about/

## To Run

From the commandline, assuming java is in the current user's PATH

**Windows**:

`$ java -jar \PATH\TO/saxon9he.jar -o:[OUTPUT FILENAME] -xsl:[\PATH\TO\ead2002toEAD3.xsl] -s:[\PATH\TO\source EAD2002 file]`

**Mac OS X and Linux**:

`$ java -jar /PATH/TO/saxon9he.jar -o:[OUTPUT FILENAME] -xsl:[/PATH/TO/ead2002toEAD3.xsl] -s:[/PATH/TO/source EAD2002 file]`

(see also http://www.saxonica.com/documentation/#!using-xsl/commandline)

Note that the oXygen XML Editor (http://www.oxygenxml.com/) comes bundled with Saxon 9.x. Instructions on running XSLT transformations in the latest version of oXygen (17.1) may be found at: http://www.oxygenxml.com/doc/versions/17.1/ug-editor/#concepts/transformation-scenario.html


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
