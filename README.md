EAD2002toEAD3
=============

XSLT 2.0 Transformations to convert EAD2002 instances to EAD3

## Selecting a Transformation

There are four versions of the EAD 2002 to EAD3 migration style sheets: EAD2002ToEAD3schema.xsl, EAD2002ToEAD3schema_undeprecated.xsl, EAD2002ToEAD3dtd.xsl, and EAD2002ToEAD3dtd_undeprecated.xsl

All versions will accept DTD, RNG, and XSD-valid instances of EAD 2002.

To transform your EAD 2002 instances to schema-valid EAD3 (either RNG or XSD schemas), use EAD2002ToEAD3schema.xsl.

To transform your EAD 2002 instances to schema-valid undprecated EAD3 (either RNG or XSD schemas), use EAD2002ToEAD3schema_undeprecated.xsl.

To transform your EAD 2002 instances to DTD-valid EAD3, use EAD2002ToEAD3dtd.xsl.

To transform your EAD 2002 instances to DTD-valid undeprecated EAD3, use EAD2002ToEAD3dtd_undeprecated.xsl.

## Requirements

EAD2002ToEAD3schema.xsl, EAD2002ToEAD3schema_undeprecated.xsl, EAD2002ToEAD3dtd.xsl, and EAD2002ToEAD3dtd_undeprecated.xsl are XSLT 2.0 transformations and therefore requires an XSLT 2.0 capable processor. Any 9.x version of Saxon should work. The latest stable free of charge and open source and release of Saxon, Saxon-HE 9.6.0.8 (for Java), is available for download at: http://sourceforge.net/projects/saxon/files/Saxon-HE/9.6/SaxonHE9-6-0-8J.zip/download.

Saxon requires JDK 1.5 (Java 2 Platform, Standard Edition 5.0) or later

Full documentation for Saxon may be found at: http://www.saxonica.com/html/documentation9.6/about/

## To Run

From the commandline, assuming java is in the current user's PATH, and with the filename of the preferred style sheet

**Windows**:

`$ java -jar \PATH\TO/saxon9he.jar -o:[OUTPUT FILENAME] -xsl:[\PATH\TO\ead2002toEAD3schema.xsl] -s:[\PATH\TO\source EAD2002 file]`

**Mac OS X and Linux**:

`$ java -jar /PATH/TO/saxon9he.jar -o:[OUTPUT FILENAME] -xsl:[/PATH/TO/ead2002toEAD3schema.xsl] -s:[/PATH/TO/source EAD2002 file]`

(see also http://www.saxonica.com/documentation/#!using-xsl/commandline)

Note that the oXygen XML Editor (http://www.oxygenxml.com/) comes bundled with Saxon 9.x. Instructions on running XSLT transformations in the latest version of oXygen (17.1) may be found at: http://www.oxygenxml.com/doc/versions/17.1/ug-editor/#concepts/transformation-scenario.html


## Parameters

A number of parameters may be set by the user. The default value should be suitable for most. To set a parameter using saxon on the command line, append param="value" to the commands described above. For example:

`$ java -jar \PATH\TO/saxon9he.jar -o:[OUTPUT FILENAME] -xsl:[\PATH\TO\ead2002toEAD3schema.xsl] -s:[\PATH\TO\source EAD2002 file] addMigrationMessages=false()`

* **outputUndeprecatedEAD3**: set to true() to produce an instance *with* elements deprecated in EAD3
  * values: true() | false()
  * default in EAD2002ToEAD3schema.xsl and EAD2002ToEAD3dtd.xsl: false()
  * default in EAD2002ToEAD3schema_undeprecated.xsl and EAD2002ToEAD3dtd_undeprecated.xsl: true()
* **addMigrationComments**: set to false() to suppress comments in converted instance recording actions performed in the transformation 
  * values: true() | false()
  * default: true()
* **addMigrationMessages**: set to false() to suppress messages sent to stderr reporting actions performed in the transformation
  * values: true() | false()
  * default: true()
* **outputValidation** set to rng, xsd, or dtd to indicate the desired type of validation schema for the output file
  * values in EAD2002ToEAD3schema.xsl and EAD2002ToEAD3schema_undeprecated.xsl : rng | xsd
  * default in EAD2002ToEAD3schema.xsl and EAD2002ToEAD3schema_undeprecated.xsl : rng
  * value in EAD2002ToEAD3dtd.xsl and EAD2002ToEAD3dtd_undeprecated.xsl : dtd
  * default in EAD2002ToEAD3dtd.xsl and EAD2002ToEAD3dtd_undeprecated.xsl : dtd
* **schemaPath** supplies path to the schema
  * value: Default Value or Value Supplied by User
  * default: ../../
* **schemaName** supplies schema filename
  * values: ead3.rng | ead3_undeprecated.rng | ead3.xsd | ead3_undeprecated.xsd | ead3.dtd | ead3_undeprecated.dtd
  * default: Determined by values of $outputValidation and #outputUndeprecatedEAD3
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
  * default: 'EAD 2002 to EAD3 Migration Style Sheet(EAD2002ToEAD3.xsl)'

## Known Issues


For descriptions of outstanding issues see: https://github.com/SAA-SDT/EAD2002toEAD3/issues/

Given an EAD2002-valid source, in most cases ead2002toEAD3.xsl should produce valid EAD3 instances with little or no data loss, especially for source files valid agains the EAD2002 W3C XML Schema a RelaxNG schemas. However, instances valid against the EAD 2002 DTD which make use of external entity references may fail .

Please report any bugs or other issues at the issue tracker for this project https://github.com/SAA-SDT/EAD2002toEAD3/issues/new
