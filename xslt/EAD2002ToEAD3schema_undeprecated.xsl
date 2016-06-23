<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsi xd xlink"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://ead3.archivists.org/schema/undeprecated/"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 27, 2012</xd:p>
            <xd:p>
                <xd:b>Last Updated: 2016-06</xd:b>
            </xd:p>
            <xd:p><xd:b>Authors:</xd:b> Terry Catapano and Mike Rush</xd:p>
            <xd:p>Convert EAD2002 instance to EAD3</xd:p>
            <xd:pre>
                <!-- 
	
Creative Commons Legal Code
CC0 1.0 Universal

    CREATIVE COMMONS CORPORATION IS NOT A LAW FIRM AND DOES NOT PROVIDE LEGAL SERVICES. DISTRIBUTION OF THIS DOCUMENT DOES NOT CREATE AN ATTORNEY-CLIENT RELATIONSHIP. CREATIVE COMMONS PROVIDES THIS INFORMATION ON AN "AS-IS" BASIS. CREATIVE COMMONS MAKES NO WARRANTIES REGARDING THE USE OF THIS DOCUMENT OR THE INFORMATION OR WORKS PROVIDED HEREUNDER, AND DISCLAIMS LIABILITY FOR DAMAGES RESULTING FROM THE USE OF THIS DOCUMENT OR THE INFORMATION OR WORKS PROVIDED HEREUNDER. 
    
Statement of Purpose

The laws of most jurisdictions throughout the world automatically confer exclusive Copyright and Related Rights (defined below) upon the creator and subsequent owner(s) (each and all, an "owner") of an original work of authorship and/or a database (each, a "Work").

Certain owners wish to permanently relinquish those rights to a Work for the purpose of contributing to a commons of creative, cultural and scientific works ("Commons") that the public can reliably and without fear of later claims of infringement build upon, modify, incorporate in other works, reuse and redistribute as freely as possible in any form whatsoever and for any purposes, including without limitation commercial purposes. These owners may contribute to the Commons to promote the ideal of a free culture and the further production of creative, cultural and scientific works, or to gain reputation or greater distribution for their Work in part through the use and efforts of others.

For these and/or other purposes and motivations, and without any expectation of additional consideration or compensation, the person associating CC0 with a Work (the "Affirmer"), to the extent that he or she is an owner of Copyright and Related Rights in the Work, voluntarily elects to apply CC0 to the Work and publicly distribute the Work under its terms, with knowledge of his or her Copyright and Related Rights in the Work and the meaning and intended legal effect of CC0 on those rights.

1. Copyright and Related Rights. A Work made available under CC0 may be protected by copyright and related or neighboring rights ("Copyright and Related Rights"). Copyright and Related Rights include, but are not limited to, the following:

    the right to reproduce, adapt, distribute, perform, display, communicate, and translate a Work;
    moral rights retained by the original author(s) and/or performer(s);
    publicity and privacy rights pertaining to a person's image or likeness depicted in a Work;
    rights protecting against unfair competition in regards to a Work, subject to the limitations in paragraph 4(a), below;
    rights protecting the extraction, dissemination, use and reuse of data in a Work;
    database rights (such as those arising under Directive 96/9/EC of the European Parliament and of the Council of 11 March 1996 on the legal protection of databases, and under any national implementation thereof, including any amended or successor version of such directive); and
    other similar, equivalent or corresponding rights throughout the world based on applicable law or treaty, and any national implementations thereof.
    
2. Waiver. To the greatest extent permitted by, but not in contravention of, applicable law, Affirmer hereby overtly, fully, permanently, irrevocably and unconditionally waives, abandons, and surrenders all of Affirmer's Copyright and Related Rights and associated claims and causes of action, whether now known or unknown (including existing as well as future claims and causes of action), in the Work (i) in all territories worldwide, (ii) for the maximum duration provided by applicable law or treaty (including future time extensions), (iii) in any current or future medium and for any number of copies, and (iv) for any purpose whatsoever, including without limitation commercial, advertising or promotional purposes (the "Waiver"). Affirmer makes the Waiver for the benefit of each member of the public at large and to the detriment of Affirmer's heirs and successors, fully intending that such Waiver shall not be subject to revocation, rescission, cancellation, termination, or any other legal or equitable action to disrupt the quiet enjoyment of the Work by the public as contemplated by Affirmer's express Statement of Purpose.

3. Public License Fallback. Should any part of the Waiver for any reason be judged legally invalid or ineffective under applicable law, then the Waiver shall be preserved to the maximum extent permitted taking into account Affirmer's express Statement of Purpose. In addition, to the extent the Waiver is so judged Affirmer hereby grants to each affected person a royalty-free, non transferable, non sublicensable, non exclusive, irrevocable and unconditional license to exercise Affirmer's Copyright and Related Rights in the Work (i) in all territories worldwide, (ii) for the maximum duration provided by applicable law or treaty (including future time extensions), (iii) in any current or future medium and for any number of copies, and (iv) for any purpose whatsoever, including without limitation commercial, advertising or promotional purposes (the "License"). The License shall be deemed effective as of the date CC0 was applied by Affirmer to the Work. Should any part of the License for any reason be judged legally invalid or ineffective under applicable law, such partial invalidity or ineffectiveness shall not invalidate the remainder of the License, and in such case Affirmer hereby affirms that he or she will not (i) exercise any of his or her remaining Copyright and Related Rights in the Work or (ii) assert any associated claims and causes of action with respect to the Work, in either case contrary to Affirmer's express Statement of Purpose.

4. Limitations and Disclaimers.

    No trademark or patent rights held by Affirmer are waived, abandoned, surrendered, licensed or otherwise affected by this document.
    Affirmer offers the Work as-is and makes no representations or warranties of any kind concerning the Work, express, implied, statutory or otherwise, including without limitation warranties of title, merchantability, fitness for a particular purpose, non infringement, or the absence of latent or other defects, accuracy, or the present or absence of errors, whether or not discoverable, all to the greatest extent permissible under applicable law.
    Affirmer disclaims responsibility for clearing rights of other persons that may apply to the Work or any use thereof, including without limitation any person's Copyright and Related Rights in the Work. Further, Affirmer disclaims responsibility for obtaining any necessary consents, permissions or other rights required for any use of the Work.
    Affirmer understands and acknowledges that Creative Commons is not a party to this document and has no duty or obligation with respect to this CC0 or use of the Work.
    
    
-->
            </xd:pre>
        </xd:desc>
    </xd:doc>
    
    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
    
    <!-- ############################################### -->
    <!-- TOP LEVEL PARAMETERS                            -->
    <!-- ############################################### -->
    
    <!-- user parameter to control validation schema of output -->
    <xsl:param name="outputValidation">
        <xsl:value-of select="'rng'"/>
        <!--<xsl:value-of select="'xsd'"/>-->
    </xsl:param>
    
    <!-- user parameter to control deprecation -->
    <xsl:param name="outputUndeprecatedEAD3" select="true()"/>

    <!-- user parameter to control migration comments -->
    <xsl:param name="addMigrationComments" select="true()"/>

    <!-- user parameter to control migration messages -->
    <xsl:param name="addMigrationMessages" select="true()"/>
    
    <!-- user parameter to specify path to schema -->
    <xsl:param name="schemaPath">
        <xsl:value-of select="'../../'"/>
    </xsl:param>
    
    <!-- user parameter to specify the schema filename -->
    <xsl:param name="schemaName">
        <xsl:choose>
            <xsl:when test="$outputValidation='rng'">
                <xsl:choose>
                    <xsl:when test="$outputUndeprecatedEAD3 = false()">
                        <xsl:value-of select="'ead3.rng'"/>
                    </xsl:when>
                    <xsl:when test="$outputUndeprecatedEAD3 = true()">
                        <xsl:value-of select="'ead3_undeprecated.rng'"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$outputValidation='xsd'">
                <xsl:choose>
                    <xsl:when test="$outputUndeprecatedEAD3 = false()">
                        <xsl:value-of select="'ead3.xsd'"/>
                    </xsl:when>
                    <xsl:when test="$outputUndeprecatedEAD3 = true()">
                        <xsl:value-of select="'ead3_undeprecated.xsd'"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$outputValidation='dtd'">
                <xsl:choose>
                    <xsl:when test="$outputUndeprecatedEAD3 = false()">
                        <xsl:value-of select="'ead3.dtd'"/>
                    </xsl:when>
                    <xsl:when test="$outputUndeprecatedEAD3 = true()">
                        <xsl:value-of select="'ead3_undeprecated.dtd'"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:param>

    <!-- user parameter for control/maintenancestatus -->
    <!-- maintenancestatus enumeration '[revised, deleted, new, 
        deletedsplit, deletedmerged, deletedreplaced, cancelled, derived]' -->
    <xsl:param name="maintenancestatusValue" select="'revised'"/>

    <!-- user parameter for control/publicationstatus -->
    <!-- publicationstatus enumeration '[inprocess, approved, published]' -->
    <xsl:param name="publicationstatusValue"/>

    <!-- user parameter for control/maintenanceagency/agencyname -->
    <xsl:param name="agencynameValue"/>

    <!-- user parameter for control/maintenancehistory/maintenanceevent/eventtype -->
    <!-- eventtype enumeration '[created, revised, deleted, cancelled, derived, updated, unknown]'  -->
    <xsl:param name="eventtypeValue" select="'updated'"/>

    <!-- user parameter for control/maintenancehistory/maintenanceevent/agenttype -->
    <!-- agenttype enumeration '[human, machine, unknown]' -->
    <xsl:param name="agenttypeValue" select="'machine'"/>

    <!-- user parameter for control/maintenancehistory/maintenanceevent/agent -->
    <xsl:param name="agent">
        <xsl:text>EAD 2002 to EAD3 Migration Style Sheet(EAD2002ToEAD3.xsl)</xsl:text>
    </xsl:param>

    <!-- user parameter for control/maintenancehistory/maintenanceevent/eventdescription -->
    <xsl:param name="eventdescriptionValue">
        <xsl:text>EAD 2002 instanace migrated to EAD3 </xsl:text>
        <xsl:if test="$outputUndeprecatedEAD3=true()">
            <xsl:text>Undeprecated </xsl:text>
        </xsl:if>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$eadxmlns"/>
        <xsl:text>).</xsl:text>
    </xsl:param>

    <!-- param for EAD3 namespace -->
    <xsl:param name="eadxmlns">
        <xsl:choose>
            <xsl:when test="$outputUndeprecatedEAD3=false()">
                <xsl:value-of select="'http://ead3.archivists.org/schema/'"/>
            </xsl:when>
            <xsl:when test="$outputUndeprecatedEAD3=true()">
                <xsl:value-of select="'http://ead3.archivists.org/schema/undeprecated/'"/>
            </xsl:when>
        </xsl:choose>
    </xsl:param>

    <!-- create namespace stripped version of input document -->

    <xsl:variable name="instance-ns-stripped">
        <xsl:apply-templates select="/" mode="strip-ns"/>
    </xsl:variable>

    <!-- MAIN TEMPLATE: operates on namespace-stripped document -->

    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="$outputValidation='rng'">
                <xsl:processing-instruction name="xml-model">
                     <xsl:value-of select="concat('href=&quot;',$schemaPath,$schemaName,'&quot; type=&quot;application/xml&quot; schematypens=&quot;http://relaxng.org/ns/structure/1.0&quot;')"/>
                </xsl:processing-instruction>
                <xsl:processing-instruction name="oxygen">
                    <xsl:value-of select="concat('RNGSchema=&quot;',$schemaPath,$schemaName,' type=&quot;xml&quot;')"/>
                </xsl:processing-instruction>
            </xsl:when>
            <xsl:when test="$outputValidation='xsd'"/>
            <!--<xsl:when test="$outputValidation='dtd'">
                <xsl:value-of select=""/>
                <xsl:processing-instruction name="DOCTYPE">
                     <xsl:value-of select="concat('ead PUBLIC &quot;+//ISBN 1-931666-00-8//DTD ',$schemaName, ' (Encoded Archival Description (EAD) Version 3)//EN&quot; &quot;', $schemaPath,$schemaName,'&quot;')"/>
                </xsl:processing-instruction>
            </xsl:when>-->
        </xsl:choose>

        <!--<xsl:copy-of select="$instance-ns-stripped"/>
        -->
        <!--<xsl:apply-templates select="/" mode="strip-ns"/>
        -->
        <xsl:for-each select="$instance-ns-stripped">
            <xsl:apply-templates/>
        </xsl:for-each>
    </xsl:template>

    <!-- ############################################### -->
    <!-- IDENTITY TEMPLATE                               -->
    <!-- ############################################### -->

    <xsl:template name="copyElement">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="element()">
        <xsl:call-template name="copyElement"/>
    </xsl:template>

    <!-- copy attributes, text, comments, and processing instructions -->
    <xsl:template match="attribute()|text()|comment()|processing-instruction()">
        <xsl:copy/>
    </xsl:template>
    
     <!-- Root EAD element -->
     <xsl:template match="ead">
         <xsl:choose>
             <xsl:when test="$outputValidation='dtd'">
                 <xsl:element name="{local-name()}">
                     <xsl:apply-templates select="@id, @altrender, @audience, @relatedencoding"/>
                     <xsl:apply-templates/>
                 </xsl:element>
             </xsl:when>
             <xsl:otherwise>
                 <xsl:element name="{local-name()}" namespace="{$eadxmlns}">
                     <xsl:apply-templates select="@id, @altrender, @audience, @relatedencoding"/>
                     <xsl:if test="$outputValidation='xsd'">
                         <xsl:attribute name="schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance">
                             <xsl:value-of select="concat($eadxmlns, ' ', $schemaPath, $schemaName)"/>
                         </xsl:attribute>
                     </xsl:if>
                     <xsl:apply-templates/>
                 </xsl:element>
             </xsl:otherwise>
         </xsl:choose>
         
    </xsl:template> 

    <!-- ############################################### -->
    <!-- DEPRECATED ELEMENTS                             -->
    <!-- ############################################### -->

    <!-- REMOVE ELEMENT COMPLETELY IF NOT UNDEPRECATED -->
    <xsl:template
        match="frontmatter | runner | descgrp/blockquote | 
        descgrp/chronlist | descgp/descgrp | descgrp/head  | descgrp/list | 
        descgrp/p | descgrp/table | descgrp/blockquote | 
        descgp/descgrp | descgrp/head  | descgrp/list | descgrp/p">
        <xsl:choose>
            <xsl:when test="$outputUndeprecatedEAD3=false()">
                <xsl:if test="node()=element()">
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:call-template name="removedElement"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$outputUndeprecatedEAD3=true()">
                <xsl:call-template name="copyElement"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- REMOVE ATTRIBUTE COMPLETELY IF NOT UNDEPRECATED -->
    <xsl:template match="@tpattern">
        <xsl:choose>
            <xsl:when test="$outputUndeprecatedEAD3=false()"/>
            <xsl:when test="$outputUndeprecatedEAD3=true()">
                <xsl:copy-of select="."/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- REMOVE COMPLETELY -->
    <xsl:template
        match="arc | resource | ead/@xsi:schemaLocation | 
        custodhist//acqinfo/head | scopecontent//arrangement/head | event/chronlist | event/list | 
        event/blockquote/chronlist | extref/blockquote/chronlist | extrefloc/blockquote/chronlist | 
        daodesc/list | extref/list | extrefloc/list | ref/list | refloc/list |
        daodesc/chronlist | extref/chronlist | extrefloc/chronlist |
        item/chronlist | p/chronlist | ref/chronlist | refloc/chronlist |
        item/blockquote/chronlist | p/blockquote/chronlist | ref/blockquote/chronlist | refloc/blockquote/chronlist | 
        event/blockquote/list | extref/blockquote/list | extrefloc/blockquote/list | item/blockquote/list | 
        p/blockquote/list | ref/blockquote/list | refloc/blockquote/list | 
        event/blockquote/table | extref/blockquote/table | extrefloc/blockquote/table | 
        item/blockquote/table | p/blockquote/table | ref/blockquote/table | refloc/blockquote/table | 
        daodesc/table | event/table | extref/table | extrefloc/table | 
        item/table | p/table | ref/table | refloc/table |
        notestmt/note/@actuate | notestmt/note/@show | notestmt/note/@label | 
        did/note/@actuate | did/note/@show | 
        did/note[(p[2] | p[title | persname | corpname | famname | name | geogname | genreform | subject | function | occupation | date | unitdate | blockqoute | chronlist | list | num | table] | child::*[local-name()!=p])]/@label | namegrp/note | 
        chronitem/date/@calendar | chronitem/date/@era | 
        chronitem/date/@certainty | chronitem/date/@encodinganalog |
        physdesc/@source | physdesc/@rules | 
        archref/dao[not(ancestor::scopecontent)][not(ancestor::bioghist)][not(ancestor::odd)] | 
        archref/daogrp[not(ancestor::scopecontent)][not(ancestor::bioghist)][not(ancestor::odd)]">
        <xsl:if test="node()=element()">
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:call-template name="removedElement"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- REMOVE dsc//dsc -->
    <xsl:template match="dsc[ancestor::dsc]">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:call-template name="removedElement"/>
                <xsl:text> Forward migration of dsc elements within other dsc elements is too complex for this style sheet. Revise the source to remove dsc elements with an ancestor dsc element before migrating to EAD3.</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    

    <!-- SKIP ELEMENT OR ATTRIBUTE IF NOT UNDEPRECATED-->
    <xsl:template match="descgrp | dimensions | physfacet | extent | bibseries | imprint">
        <xsl:choose>
            <xsl:when test="$outputUndeprecatedEAD3=false()">
                <xsl:call-template name="commentAndMessage">
                    <xsl:with-param name="comment">
                        <xsl:call-template name="removedElement"/>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="$outputUndeprecatedEAD3=true()">
                <xsl:call-template name="copyElement"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- SKIP ELEMENT OR ATTRIBUTE -->
    <xsl:template
        match="titleproper/date | titleproper/num | 
        archref/abstract | archref/container | 
        archref/langmaterial | archref/materialspec |
        archref/origination | archref/physdesc |
        archref/physloc | archref/repository |
        archref/unitid |
        bibref/archref | bibref/edition |
        subtitle/date | subtitle/num |
        corpname/subarea | 
        item/repository | 
        custodhist//acqinfo | scopecontent//arrangement |
        materialspec/num | materialspec/materialspec |  
        entry/origination | entry/repository |
        event/origination | event/repository |
        extref/origination | extref/repository |
        extrefloc/origination | extrefloc/repository |
        item/origination | item/repository |
        label/corpname | label/date |
        label/famname | label/function |
        label/genreform | label/geogname |
        label/name | label/num |
        label/occupation | label/origination | 
        label/persname | label/repository |
        label/subject | 
        label/unitdate | 
        archref/unitdate/title | 
        entry/unitdate/title | 
        event/unitdate/title | 
        extref/unitdate/title | 
        extrefloc/unitdate/title | 
        item/unitdate/title | 
        p/unitdate/title | 
        ref/unitdate/title | 
        refloc/unitdate/title | 
        p/origination | p/repository |
        ref/origination | ref/origination |
        refloc/origination | refloc/origination |
        unittitle[parent::* except (//did)] | 
        langusage | language[parent::langusage] | 
        language[parent::langmaterial] |
        physdesc/date | physdesc/corpname |
        physdesc/famname | physdesc/function |
        physdesc/genreform | physdesc/geogname |
        physdesc/name | physdesc/occupation |
        physdesc/persname | physdesc/subject |
        title/date | title/num |
        descrules |
        unittitle/edition | did/note[not(p[2])][not(*[local-name()!='p'])][not(p[title | persname | corpname | famname | name | geogname | genreform | subject | function | occupation | date | unitdate | blockqoute | chronlist | list | num | table])]/p | 
        event/blockquote/p | extref/blockquote/p | extrefloc/blockquote/p | 
        item/blockquote/p | p/blockquote/p | ref/blockquote/p | refloc/blockquote/p">
        <xsl:if test="node()=element()">
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:call-template name="removedElement"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        <xsl:apply-templates/>
    </xsl:template>

    <!-- archref and bibref -->

    <xsl:template
        match="archref[not(parent::separatedmaterial)][not(parent::relatedmaterial)][not(parent::otherfindaid)][not(parent::bibliography)][not(parent::bibref)]">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT archref CONVERTED TO ref</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <ref>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <xsl:template
        match="bibref[not(parent::separatedmaterial)][not(parent::relatedmaterial)][not(parent::otherfindaid)][not(parent::bibliography)]">
        <ref>
            <xsl:apply-templates select="@*"/>
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:text>ELEMENT bibref CONVERTED TO ref</xsl:text>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <xsl:template match="archref[not(parent::bibref)][parent::bibliography or parent::otherfindaid or parent::relatedmaterial or parent::separatedmaterial] | 
        bibref[parent::bibliography or parent::otherfindaid or parent::relatedmaterial or parent::separatedmaterial]">
        
        <xsl:element name="{local-name()}">
            <xsl:apply-templates
                select="@* except(@actuate, @arcrole, @href, @role, @show, @title, @xpointer)"/>
            <xsl:choose>
                <xsl:when test="@actuate | @arcrole | @href | @role | @show | @title | @xpointer">
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>LINKING ATTRIBUTES REMOVED FROM ELEMENT </xsl:text>
                            <xsl:value-of select="local-name()"/>
                            <xsl:text> AND SHIFTED TO CHILD ref ELEMENT</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                    <ref>
                        <xsl:apply-templates
                            select="@actuate, @arcrole, @href, @role, @show, @title, @xpointer"/>
                        <xsl:apply-templates/>
                    </ref>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>


    <!-- ############################################### -->
    <!-- type attributes                            -->
    <!-- ############################################### -->

    <xsl:template match="dsc/@type">
        <xsl:attribute name="{parent::*/local-name()}type">
            <xsl:choose>
                <xsl:when test="string(.)='othertype'">
                    <xsl:value-of select="'otherdsctype'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="string(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="unitdate/@type">
        <xsl:attribute name="{parent::*/local-name()}type" select="string(.)"/>
    </xsl:template>

    <xsl:template match="dsc/@othertype">
        <xsl:attribute name="otherdsctype" select="string(.)"/>
    </xsl:template>

    <!-- ############################################### -->
    <!-- EADHEADER to CONTROL -->
    <!-- ############################################### -->

    <xsl:template match="eadheader">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT eadheader REPLACED WITH control</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <control>
            <xsl:apply-templates select="@*[not(local-name()='findaidstatus')]"/>

            <xsl:apply-templates select="eadid"/>

            <xsl:apply-templates select="filedesc"/>

            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:text>ELEMENT maintenancestatus ADDED</xsl:text>
                </xsl:with-param>
            </xsl:call-template>
            <maintenancestatus value="{$maintenancestatusValue}"/>

            <xsl:if test="normalize-space($publicationstatusValue)">
                <xsl:call-template name="commentAndMessage">
                    <xsl:with-param name="comment">
                        <xsl:text>ELEMENT publicationstatus ADDED</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <publicationstatus value="{$publicationstatusValue}"/>
            </xsl:if>

            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:text>ELEMENT maintenanceagency ADDED</xsl:text>
                </xsl:with-param>
            </xsl:call-template>
            <maintenanceagency>
                <xsl:if test="eadid/@countrycode">
                    <xsl:apply-templates select="eadid/@countrycode"/>
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>ATTRIBUTE eadid/@countrycode REPLACED WITH maintenanceagency/@countrycode</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
                <xsl:if test="eadid/@mainagencycode">
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>ATTRIBUTE eadid/@mainagencycode REPLACED WITH ELEMENT maintenanceagency/agencycode</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                    <agencycode>
                        <xsl:value-of select="eadid/@mainagencycode"/>
                    </agencycode>
                </xsl:if>
                <xsl:call-template name="commentAndMessage">
                    <xsl:with-param name="comment">
                        <xsl:text>ELEMENT agencyname ADDED</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <agencyname>
                    <xsl:choose>
                        <xsl:when test="normalize-space($agencynameValue)">
                            <xsl:value-of select="$agencynameValue"/>
                        </xsl:when>
                        <xsl:when test="filedesc/publicationstmt/publisher">
                            <xsl:for-each select="filedesc/publicationstmt/publisher">
                                <xsl:value-of select="normalize-space(.)"/>
                                <xsl:if test="position()!=last()">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>[Agency Name]</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </agencyname>
            </maintenanceagency>

            <xsl:call-template name="languagedeclaration"/>

            <xsl:call-template name="descrules"/>

            <xsl:if test="@findaidstatus">
                <xsl:call-template name="commentAndMessage">
                    <xsl:with-param name="comment">
                        <xsl:text>ATTRIBUTE eadheader/@findaidstatus REPLACED WITH ELEMENT localcontrol/term</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <localcontrol localtype="findaidstatus">
                    <term>
                        <xsl:value-of select="@findaidstatus"/>
                    </term>
                </localcontrol>
            </xsl:if>

            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:text>ELEMENT maintenancehistory ADDED</xsl:text>
                </xsl:with-param>
            </xsl:call-template>
            <maintenancehistory>
                <xsl:copy-of select="revisiondesc/@*"/>
                <xsl:call-template name="commentAndMessage">
                    <xsl:with-param name="comment">
                        <xsl:text>ELEMENT maintenanceevent ADDED FOR THE EVENT OF MIGRATION TO EAD3</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <maintenanceevent>
                    <eventtype value="{$eventtypeValue}"/>
                    <eventdatetime standarddatetime="{current-dateTime()}">
                        <xsl:value-of select="current-dateTime()"/>
                    </eventdatetime>
                    <agenttype value="{$agenttypeValue}"/>
                    <agent>
                        <xsl:value-of select="$agent"/>
                    </agent>
                    <eventdescription>
                        <xsl:value-of select="$eventdescriptionValue"/>
                    </eventdescription>
                </maintenanceevent>
                <xsl:if test="profiledesc/creation">
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>ELEMENT creation REPLACED WITH maintenanceevent</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                    <maintenanceevent>
                        <xsl:copy-of select="profiledesc/creation/@*"/>
                        <eventtype value="created"/>
                        <eventdatetime>
                            <xsl:choose>
                                <xsl:when
                                    test="profiledesc/creation/date and not(profiledesc/creation/date[2])">
                                    <xsl:copy-of
                                        select="profiledesc/creation/date/@*[not(local-name()='calendar') and not(local-name()='era') and not(local-name()='certainty') and not(local-name()='type') and not(local-name()='normal')]"/>
                                    <xsl:if
                                        test="normalize-space(profiledesc/creation/date/@normal)">
                                        <xsl:attribute name="standarddatetime">
                                            <xsl:choose>
                                                <xsl:when test="contains(profiledesc/creation/date/@normal,'/')">
                                                    <xsl:call-template name="fixNormalDate">
                                                        <xsl:with-param name="normalValue">
                                                            <xsl:value-of select="substring-after(profiledesc/creation/date/@normal,'/')"/>
                                                        </xsl:with-param>
                                                    </xsl:call-template>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:call-template name="fixNormalDate">
                                                        <xsl:with-param name="normalValue">
                                                            <xsl:value-of select="profiledesc/creation/date/@normal"/>
                                                        </xsl:with-param>
                                                    </xsl:call-template>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="profiledesc/creation/date"/>
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                        </eventdatetime>
                        <agenttype value="unknown"/>
                        <agent/>
                        <eventdescription>
                            <xsl:value-of select="profiledesc/creation"/>
                        </eventdescription>
                    </maintenanceevent>
                </xsl:if>
                <xsl:for-each select="revisiondesc/change">
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>ELEMENT change REPLACED WITH maintenanceevent</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                    <maintenanceevent>
                        <xsl:copy-of select="@*"/>
                        <eventtype value="unknown"/>
                        <eventdatetime>
                            <xsl:copy-of
                                select="date/@*[not(local-name()='calendar') and not(local-name()='era') and not(local-name()='certainty') and not(local-name()='type') and not(local-name()='normal')]"/>
                            <xsl:if
                                test="normalize-space(date/@normal)">
                                <xsl:attribute name="standarddatetime">
                                    <xsl:choose>
                                        <xsl:when test="contains(date/@normal,'/')">
                                            <xsl:call-template name="fixNormalDate">
                                                <xsl:with-param name="normalValue">
                                                    <xsl:value-of select="substring-after(date/@normal,'/')"/>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:call-template name="fixNormalDate">
                                                <xsl:with-param name="normalValue">
                                                    <xsl:value-of select="date/@normal"/>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="date"/>
                        </eventdatetime>
                        <agenttype value="unknown"/>
                        <agent/>
                        <eventdescription>
                            <xsl:copy-of select="item/@*"/>
                            <xsl:value-of select="item"/>
                        </eventdescription>
                    </maintenanceevent>
                </xsl:for-each>
                <xsl:for-each select="revisiondesc/list/item">
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>ELEMENT revisiondesc/list/item REPLACED WITH maintenanceevent</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                    <maintenanceevent>
                        <xsl:copy-of select="@*"/>
                        <eventtype value="unknown"/>
                        <eventdatetime/>
                        <agenttype value="unknown"/>
                        <agent/>
                        <eventdescription>
                            <xsl:value-of select="."/>
                        </eventdescription>
                    </maintenanceevent>
                </xsl:for-each>
                <xsl:for-each select="revisiondesc/list/defitem">
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>ELEMENT revisiondesc/list/defitem REPLACED WITH maintenanceevent</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                    <maintenanceevent>
                        <xsl:copy-of select="@*"/>
                        <eventtype value="unknown"/>
                        <eventdatetime/>
                        <agenttype value="unknown"/>
                        <agent/>
                        <eventdescription>
                            <xsl:copy-of select="item/@*"/>
                            <xsl:value-of select="label"/>
                            <xsl:text>: </xsl:text>
                            <xsl:value-of select="item"/>
                        </eventdescription>
                    </maintenanceevent>
                </xsl:for-each>
            </maintenancehistory>
        </control>
    </xsl:template>
    
    <xsl:template match="@countrycode">
        <xsl:attribute name="{local-name()}" select="upper-case(.)"/>
    </xsl:template>
    
    <xsl:template name="fixNormalDate">
        <xsl:param name="normalValue"/>
        <xsl:choose>
            <xsl:when test="string-length($normalValue)>4 and not(contains($normalValue,'-'))">
                <xsl:choose>
                    <xsl:when test="string-length($normalValue)=6">
                        <xsl:value-of select="concat(substring($normalValue,1,4),'-',substring($normalValue,5,2))"/>
                    </xsl:when>
                    <xsl:when test="string-length($normalValue)=8">
                        <xsl:value-of select="concat(substring($normalValue,1,4),'-',substring($normalValue,5,2),'-',substring($normalValue,7,2))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$normalValue"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$normalValue"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="fixNormalDateRange">
        <xsl:param name="normalRangeValue"/>
        <xsl:variable name="normalRangeValueBegin">
            <xsl:call-template name="fixNormalDate">
                <xsl:with-param name="normalValue">
                    <xsl:value-of select="substring-before($normalRangeValue,'/')"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="normalRangeValueEnd">
            <xsl:call-template name="fixNormalDate">
                <xsl:with-param name="normalValue">
                    <xsl:value-of select="substring-after($normalRangeValue,'/')"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="concat($normalRangeValueBegin,'/',$normalRangeValueEnd)"/>
    </xsl:template>

    <xsl:template match="@countryencoding | @dateencoding | @langencoding | @repositoryencoding | @scriptencoding">
        <xsl:attribute name="{local-name()}" select="lower-case(.)"/>
    </xsl:template>
    
    <xsl:template match="eadid">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT eadid REPLACED WITH recordid</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <recordid>
            <xsl:if test="@encodinganalog">
                <xsl:copy-of select="@encodinganalog"/>
            </xsl:if>
            <xsl:value-of select="."/>
        </recordid>
        <xsl:if test="@publicid">
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:text>ATTRIBUTE eadid/@publicid REPLACED WITH otherrecordid</xsl:text>
                </xsl:with-param>
            </xsl:call-template>
            <otherrecordid localtype="publicid">
                <xsl:value-of select="@publicid"/>
            </otherrecordid>
        </xsl:if>
        <xsl:if test="@identifier">
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:text>ATTRIBUTE eadid/@identifier REPLACED WITH otherrecordid</xsl:text>
                </xsl:with-param>
            </xsl:call-template>
            <otherrecordid localtype="identifier">
                <xsl:value-of select="@identifier"/>
            </otherrecordid>
        </xsl:if>
        <xsl:if test="@url">
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:text>ATTRIBUTE eadid/@url REPLACED WITH otherrecordid</xsl:text>
                </xsl:with-param>
            </xsl:call-template>
            <otherrecordid localtype="url">
                <xsl:value-of select="@url"/>
            </otherrecordid>
        </xsl:if>
        <xsl:if test="@urn">
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:text>ATTRIBUTE eadid/@urn REPLACED WITH otherrecordid</xsl:text>
                </xsl:with-param>
            </xsl:call-template>
            <otherrecordid localtype="urn">
                <xsl:value-of select="@urn"/>
            </otherrecordid>
        </xsl:if>
    </xsl:template>

    <!-- langusage -->
    <xsl:template name="languagedeclaration">
        <xsl:variable name="langusage">
            <xsl:apply-templates select="profiledesc/langusage"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="profiledesc/langusage/language">
                <xsl:for-each select="profiledesc/langusage/language">
                    <xsl:variable name="scriptcodeValueUpdated">
                        <xsl:call-template name="scriptcodeValueUpdate">
                            <xsl:with-param name="scriptcodeValue" select="@scriptcode"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>ELEMENT langusage REPLACED WITH languagedeclaration</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                    <languagedeclaration>
                        <xsl:choose>
                            <xsl:when test="../language[2]">
                                <xsl:apply-templates
                                    select="/ead//langusage/@*[not(local-name()='id')]"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="/ead//langusage/@*"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <language>
                            <xsl:apply-templates select="@* except @scriptcode"/>
                            <xsl:value-of select="."/>
                        </language>
                        <script>
                            <xsl:if test="normalize-space($scriptcodeValueUpdated)">
                                <xsl:attribute name="scriptcode">
                                    <xsl:value-of select="$scriptcodeValueUpdated"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="commentAndMessage">
                                <xsl:with-param name="comment">
                                    <xsl:text>SCRIPT NAME NEEDED</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </script>
                        <descriptivenote>
                            <p>
                                <xsl:copy-of select="$langusage"/>
                            </p>
                        </descriptivenote>
                    </languagedeclaration>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="profiledesc/langusage[not(language)]">
                <xsl:call-template name="commentAndMessage">
                    <xsl:with-param name="comment">
                        <xsl:text>ELEMENT langusage REPLACED WITH languagedeclaration</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <languagedeclaration>
                    <xsl:apply-templates select="/ead//langusage/@*"/>
                    <language/>
                    <script/>
                    <descriptivenote>
                        <p>
                            <xsl:apply-templates select="profiledesc/langusage"/>
                        </p>
                    </descriptivenote>
                </languagedeclaration>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>

    <!-- descrules -->
    <xsl:template name="descrules">
        <xsl:variable name="descrules">
            <xsl:apply-templates select="profiledesc/descrules"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="profiledesc/descrules/title">
                <xsl:for-each select="profiledesc/descrules/title">
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>ELEMENT descrules REPLACED WITH conventiondeclaration</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                    <conventiondeclaration>
                        <xsl:choose>
                            <xsl:when test="../title[2]">
                                <xsl:apply-templates
                                    select="/ead//descrules/@*[not(local-name()='id')]"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="/ead//descrules/@*"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <citation>
                            <xsl:value-of select="."/>
                        </citation>
                        <descriptivenote>
                            <p>
                                <xsl:copy-of select="$descrules"/>
                            </p>
                        </descriptivenote>
                    </conventiondeclaration>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="profiledesc/descrules[not(title)]">
                <xsl:call-template name="commentAndMessage">
                    <xsl:with-param name="comment">
                        <xsl:text>ELEMENT descrules REPLACED WITH conventiondeclaration</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <conventiondeclaration>
                    <xsl:apply-templates select="/ead//descrules/@*"/>
                    <citation/>
                    <descriptivenote>
                        <p>
                            <xsl:copy-of select="$descrules"/>
                        </p>
                    </descriptivenote>
                </conventiondeclaration>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>

    <!-- blockquote -->
    <xsl:template match="blockquote">
        <xsl:choose>
            <xsl:when
                test="parent::event | parent::extref | parent::extrefloc | 
                parent::item | parent::p | parent::ref | parent::refloc">
                <xsl:call-template name="commentAndMessage">
                    <xsl:with-param name="comment">
                        <xsl:text>ELEMENT blockquote CONVERTED TO quote</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:element name="quote">
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="copyElement"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- ############################################### -->
    <!-- CHRONLIST                                       -->
    <!-- ############################################### -->

    <xsl:template match="eventgrp">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT eventgrp CONVERTED TO chronitemset</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:element name="chronitemset">
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="chronitem/date">
        <xsl:choose>
            <xsl:when test="@normal">
                <xsl:choose>
                    <xsl:when test="contains(@normal,'/')">
                        <xsl:variable name="dateRangeString">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:variable>
                        <xsl:variable name="normalizedDateRangeString">
                            <xsl:value-of select="translate($dateRangeString,'-–—','---')"/>
                        </xsl:variable>
                        <xsl:variable name="normalizedDateRangeStringDashCount" select="string-length($normalizedDateRangeString)-string-length(translate($normalizedDateRangeString,'-',''))"/>
                        <xsl:call-template name="commentAndMessage">
                            <xsl:with-param name="comment">
                                <xsl:text>ELEMENT chronitem/date CONVERTED TO chronitem/daterange</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                        <xsl:element name="daterange">
                            <xsl:apply-templates select="@*[not(local-name()='normal')]"/>
                            <xsl:element name="fromdate">
                                <xsl:attribute name="standarddate">
                                    <xsl:call-template name="fixNormalDate">
                                        <xsl:with-param name="normalValue">
                                            <xsl:value-of select="substring-before(@normal,'/')"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$normalizedDateRangeStringDashCount=1">
                                        <xsl:value-of select="substring-before($normalizedDateRangeString,'-')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            <xsl:element name="todate">
                                <xsl:attribute name="standarddate">
                                    <xsl:call-template name="fixNormalDate">
                                        <xsl:with-param name="normalValue">
                                            <xsl:value-of select="substring-after(@normal,'/')"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:attribute>
                                <xsl:if test="$normalizedDateRangeStringDashCount=1">
                                    <xsl:value-of select="substring-after($normalizedDateRangeString,'-')"/>
                                </xsl:if>
                            </xsl:element>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="commentAndMessage">
                            <xsl:with-param name="comment">
                                <xsl:text>ELEMENT chronitem/date CONVERTED TO chronitem/datesingle</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                        <xsl:element name="datesingle">
                            <xsl:attribute name="standarddate">
                                <xsl:call-template name="fixNormalDate">
                                    <xsl:with-param name="normalValue">
                                        <xsl:value-of select="@normal"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:attribute>
                            <xsl:apply-templates select="@*[not(local-name()='normal')]"/>
                            <xsl:apply-templates/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="commentAndMessage">
                    <xsl:with-param name="comment">
                        <xsl:text>ELEMENT chronitem/date CONVERTED TO chronitem/datesingle</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:element name="datesingle">
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- ############################################### -->
    <!-- LIST                                            -->
    <!-- ############################################### -->
    
    <xsl:template match="list">
        <list>
            <xsl:apply-templates select="@* except (@type, @continuation, @mark)"/>
            <xsl:if test="@type">
                <xsl:attribute name="listtype">
                    <xsl:choose>
                        <xsl:when test="@type='simple' or @type='marked'">
                            <xsl:value-of select="'unordered'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@type"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@type='simple'">
                <xsl:attribute name="mark" select="'none'"/>
            </xsl:if>
            <xsl:if test="@mark and not(@type='simple')">
                <xsl:variable name="markValue" select="@mark"/>
                <xsl:choose>
                    <xsl:when test="$markValue='disc' or $markValue='circle' or 
                        $markValue='square' or $markValue='none' or 
                        $markValue='inherit'">
                            <xsl:attribute name="mark">
                                <xsl:value-of select="$markValue"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="mark">
                                <xsl:value-of select="'disc'"/>
                            </xsl:attribute>
                            <xsl:call-template name="commentAndMessage">
                                <xsl:with-param name="comment">
                                    <xsl:text>@mark value "</xsl:text><xsl:value-of select="$markValue"/><xsl:text> converted to "disc".</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                
            </xsl:if>
            <xsl:if test="@numeration">
                <xsl:attribute name="numeration">
                    <xsl:choose>
                        <xsl:when test="@numeration='arabic'">
                            <xsl:value-of select="'decimal'"/>
                        </xsl:when>
                        <xsl:when test="@numeration='upperalpha'">
                            <xsl:value-of select="'upper-alpha'"/>
                        </xsl:when>
                        <xsl:when test="@numeration='loweralpha'">
                            <xsl:value-of select="'lower-alpha'"/>
                        </xsl:when>
                        <xsl:when test="@numeration='upperroman'">
                            <xsl:value-of select="'upper-roman'"/>
                        </xsl:when>
                        <xsl:when test="@numeration='lowerroman'">
                            <xsl:value-of select="'lower-roman'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="'decimal'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>
            <xsl:for-each select="@continuation">
                <xsl:call-template name="commentAndMessage">
                    <xsl:with-param name="comment">
                        <xsl:call-template name="removedElement"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:apply-templates select="*"/>
        </list>
    </xsl:template>





    <!-- ############################################### -->
    <!-- DID ELEMENTS                                    -->
    <!-- ############################################### -->

    <xsl:template match="did">
        <did>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates
                select="*[not(local-name()='note')] | 
                note[p][not(p[2])][not(*[not(local-name()='p')])][not(p[title | persname | corpname | famname | name | geogname | genreform | subject | function | occupation | date | unitdate | blockqoute | chronlist | list | num | table])]"/>
            <xsl:apply-templates
                select="parent::*/dao | parent::*/daogrp | child::dao | child::daogrp | parent::*/scopecontent//dao | parent::*/bioghist//dao | parent::*/odd//dao | parent::*/scopecontent//daogrp | parent::*/bioghist//daogrp | parent::*/odd//daogrp"
                mode="daoIndid"/>
        </did>
        <xsl:apply-templates select="note[p[2] | *[not(local-name()='p')] | p[title | persname | corpname | famname | name | geogname | genreform | subject | function | occupation | date | unitdate | blockqoute | chronlist | list | num | table]]"
        />
    </xsl:template>

    <xsl:template match="dao[not(parent::did)][not(parent::archref)] | daogrp[not(parent::did)][not(parent::archref)]">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment" select="'ELEMENT dao OR daogrp OUTSIDE did MOVED INTO did'"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="dao[parent::did] | daogrp[parent::did]"> </xsl:template>

    <xsl:template match="daogrp[count(child::daoloc) &gt; 1]" mode="daoIndid">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment" select="'ELEMENT daogrp CONVERTED TO daoset'"/>
        </xsl:call-template>
        <daoset>
            <xsl:apply-templates select="@*[not(local-name()='role' and not(local-name()='title'))]"/>
            <xsl:apply-templates select="daoloc"/>
            <xsl:if test="resource[normalize-space(.)] or daodesc">
                <descriptivenote>
                    <xsl:apply-templates select="daodesc/@*"/>
                    <xsl:for-each select="resource[normalize-space(.)]">
                        <p>
                            <xsl:apply-templates/>
                        </p>
                    </xsl:for-each>
                    <xsl:for-each select="daodesc">
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </descriptivenote>
            </xsl:if>
        </daoset>
    </xsl:template>

    <xsl:template match="daogrp[count(child::daoloc) = 1]" mode="daoIndid">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment" select="'ELEMENT daogrp[count(child::daoloc) = 1] CONVERTED TO dao'"/>
        </xsl:call-template>
        <dao>
            <xsl:apply-templates
                select="daoloc/@*"/>
            <xsl:if test="arc and not(arc[2])">
                <xsl:apply-templates select="arc/@actuate | arc/@show"/>
            </xsl:if>
            <xsl:attribute name="daotype">
                <xsl:text>unknown</xsl:text>
            </xsl:attribute>
            <xsl:if test="resource[normalize-space(.)] or daodesc or daoloc/daodesc">
                <descriptivenote>
                    <xsl:choose>
                        <xsl:when test="daodesc and not(daoloc/daodesc)">
                            <xsl:apply-templates select="daodesc/@*"/>
                        </xsl:when>
                        <xsl:when test="daoloc/daodesc and not(daodesc)">
                            <xsl:apply-templates select="daoloc/daodesc/@*"/>
                        </xsl:when>
                        <xsl:when test="daodesc and daoloc/daodesc">
                            <xsl:apply-templates select="daodesc/@*"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:apply-templates select="daodesc/@*"/>
                    <xsl:for-each select="resource[normalize-space(.)]">
                        <p>
                            <xsl:apply-templates/>
                        </p>
                    </xsl:for-each>
                    <xsl:for-each select="daodesc">
                        <xsl:apply-templates/>
                    </xsl:for-each>
                    <xsl:for-each select="daoloc/daodesc">
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </descriptivenote>
            </xsl:if>
        </dao>
    </xsl:template>
    
    <xsl:template match="daogrp[count(child::daoloc) = 0]" mode="daoIndid">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment" select="'ELEMENT daogrp[count(child::daoloc) = 0] REMOVED'"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="dao" mode="daoIndid">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>REQUIRED ATTRIBUTE daotype ADDED TO dao WITH VALUE "unknown"</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <dao>
            <xsl:attribute name="daotype">
                <xsl:text>unknown</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </dao>
    </xsl:template>

    <xsl:template match="daoloc">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT daoloc CONVERTED TO daoset/dao</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <dao>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="daotype">
                <xsl:text>unknown</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </dao>
    </xsl:template>
    
    <xsl:template match="daodesc">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT </xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:text>RENAMED AS 'descriptivenote'</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <descriptivenote>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </descriptivenote>
    </xsl:template>
    
    <xsl:template match="origination">
        <xsl:if test="normalize-space(.)">
            <origination>
                <xsl:apply-templates select="@*"/>
                <xsl:choose>
                    <xsl:when test="not(text()[normalize-space(.)]) and not(*[not(local-name()='persname')][not(local-name()='corpname')][not(local-name()='famname')][not(local-name()='name')])">
                        <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:when test="not(.//persname | .//corpname | .//famname | .//name)">
                        <xsl:call-template name="commentAndMessage">
                            <xsl:with-param name="comment">
                                <xsl:text>origination ELEMENT VALUE MOVED INTO name ELEMENT</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                        <name>
                            <part>
                                <xsl:apply-templates/>
                            </part>
                        </name>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select=".//*[local-name()='persname' 
                            or local-name()='corpname' 
                            or local-name()='famname' 
                            or local-name()='name']"/>
                        <xsl:call-template name="commentAndMessage">
                            <xsl:with-param name="comment">
                                <xsl:text>ORIGINAL origination VALUE WAS AS FOLLOWS:
                            "</xsl:text><xsl:value-of select="normalize-space(.)"/><xsl:text>"
                            PORTIONS NOT INCLUDED IN  persname, corpname, famname, OR name ELEMENTS WERE LOST.</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </origination>
        </xsl:if>
    </xsl:template>

    <!-- keep contents of unitdate, move unitdate element outside unittitle -->
    <xsl:template match="unittitle[parent::did]">
        <unittitle>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </unittitle>
        <xsl:if test="$outputUndeprecatedEAD3=false()">
            <xsl:for-each select="unitdate">
                <xsl:call-template name="commentAndMessage">
                    <xsl:with-param name="comment">
                        <xsl:text>ELEMENT unitdate MOVED FROM unittitle CHILD TO unittitle SIBLING</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="copyElement"/>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template match="unitdate[parent::unittitle]">
        <xsl:choose>
            <xsl:when test="$outputUndeprecatedEAD3=true()">
                <xsl:call-template name="copyElement"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="following-sibling::node()">
                        <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="repository">
        <repository>
            <xsl:apply-templates select="@*"/>
            <xsl:choose>
                <xsl:when test="not(text()[normalize-space(.)]) and not(*[not(local-name()='corpname')][not(local-name()='name')][not(local-name()='subarea')][not(local-name()='address')])">
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:when test="not(.//corpname | .//subarea | .//name)">
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>repository ELEMENT VALUE MOVED INTO name ELEMENT</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                    <name>
                        <part>
                            <xsl:apply-templates select="node()[normalize-space(.)][not(local-name()='address')]"/>
                        </part>
                    </name>
                    <xsl:if test="address">
                        <xsl:apply-templates select="address"/>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select=".//*[local-name()='corpname' 
                        or local-name()='subarea' 
                        or local-name()='name' 
                        or local-name()='address'][not(parent::corpname)]"/>
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>ORIGINAL repository VALUE WAS AS FOLLOWS:
                            "</xsl:text><xsl:value-of select="normalize-space(.)"/><xsl:text>"
                            PORTIONS NOT INCLUDED IN  corpname, name, subarea, OR address ELEMENTS WERE LOST.</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </repository>
    </xsl:template>
    
    <xsl:template match="langmaterial">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>MIXED CONTENT REMOVED FROM langmaterial</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <langmaterial>
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="language">
                <xsl:choose>
                    <xsl:when test="@scriptcode">
                        <xsl:apply-templates select="." mode="languageset"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="." mode="nolanguageset"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:if test="not(language)">
                <language>
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>LANGUAGE NAME NEEDED</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                </language>
            </xsl:if>
            <xsl:if test="node()[not(local-name()='language')][normalize-space(.)]">
                <descriptivenote>
                    <p>
                        <xsl:apply-templates/>
                    </p>
                </descriptivenote>
            </xsl:if>
        </langmaterial>
    </xsl:template>

    <xsl:template match="language" mode="languageset">
        <xsl:variable name="scriptcodeValueUpdated">
            <xsl:call-template name="scriptcodeValueUpdate">
                <xsl:with-param name="scriptcodeValue" select="@scriptcode"/>
            </xsl:call-template>
        </xsl:variable>
        <languageset>
            <xsl:element name="language">
                <xsl:apply-templates select="@* except @scriptcode"/>
                <xsl:apply-templates/>
            </xsl:element>
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:text>ELEMENT script CREATED FROM ATTRIBUTE language/@scriptcode</xsl:text>
                </xsl:with-param>
            </xsl:call-template>
            <script scriptcode="{$scriptcodeValueUpdated}"/>
        </languageset>
    </xsl:template>
    
    <xsl:template match="language" mode="nolanguageset">
        <xsl:element name="language">
            <xsl:apply-templates select="@* except @scriptcode"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="scriptcodeValueUpdate">
        <xsl:param name="scriptcodeValue"/>
        <xsl:variable name="scriptcodeValueLength" select="string-length($scriptcodeValue)"/>
        <xsl:variable name="scriptcodeValueLengthLessOne" select="$scriptcodeValueLength - 1"/>
        <xsl:value-of select="concat(upper-case(substring($scriptcodeValue,1,1)),substring($scriptcodeValue,2,$scriptcodeValueLengthLessOne))"/>
    </xsl:template>




    <!-- ############################################### -->
    <!-- NAMES  AND CONTROLLACCESS                       -->
    <!-- ############################################### -->

    <xsl:template
        match="famname | persname | name | subject | occupation | geogname | function | genreform">
        <xsl:if test="normalize-space(.)">
            <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ADDED CHILD ELEMENT part TO </xsl:text>
                <xsl:value-of select="local-name()"/>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@*"/>
            <part>
                <xsl:apply-templates/>
            </part>
        </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="title">

        <xsl:if test="normalize-space(.)">
            <xsl:choose>
            <xsl:when
                test="parent::bibliography or 
                parent::otherfindaid or 
                parent::relatedmaterial or 
                parent::separatedmaterial">
                <p>
                    <xsl:call-template name="titleLinkDecomposeAddPart"/>
                </p>
            </xsl:when>
            <xsl:when test="parent::emph | parent::label | parent::origination |
                parent::repository | parent::physdesc | parent::container |
                parent::unitdate | parent::unitid | parent::physloc">
                <xsl:choose>
                    <xsl:when test="@actuate or @arcrole or @href or @role or @show 
                        or @title or @entityref or @xpointer">
                        <ref>
                            <xsl:apply-templates select="@actuate | @arcrole | @href | @role | @show 
                                | @title | @entityref | @xpointer"/>
                            <xsl:apply-templates/>
                        </ref>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="titleLinkDecomposeAddPart"/>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template name="titleLinkDecomposeAddPart">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ADDED CHILD ELEMENT part TO </xsl:text>
                <xsl:value-of select="local-name()"/>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:choose>
            <xsl:when
                test="(normalize-space(@href) or normalize-space(@entityref) or normalize-space(@xpointer))
                and not(parent::controlaccess)">
                <ref>
                    <xsl:apply-templates
                        select="@actuate
                        | @arcrole
                        | @href
                        | @role
                        | @show
                        | @title
                        | @entityref | @xpointer"/>
                    <xsl:element name="{local-name()}">
                        <xsl:apply-templates
                            select="@altrender | @audience
                            | @authfilenumber | @encodinganalog
                            | @id | @normal
                            | @render | @rules
                            | @source | @type"/>
                        <part>
                            <xsl:apply-templates/>
                        </part>
                    </xsl:element>
                </ref>
            </xsl:when>
            <xsl:when
                test="(@href or @entityref or @xpointer)
                and parent::controlaccess">
                <p>
                <ref>
                    <xsl:apply-templates
                        select="@actuate
                        | @arcrole
                        | @href
                        | @role
                        | @show
                        | @title
                        | @entityref | @xpointer"/>
                    <xsl:element name="{local-name()}">
                        <xsl:apply-templates
                            select="@altrender | @audience
                            | @authfilenumber | @encodinganalog
                            | @id | @normal
                            | @render | @rules
                            | @source | @type"/>
                        <part>
                            <xsl:apply-templates/>
                        </part>
                    </xsl:element>
                </ref>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{local-name()}">
                    <xsl:apply-templates
                        select="@altrender | @audience
                        | @authfilenumber | @encodinganalog
                        | @id | @normal
                        | @render | @rules
                        | @source | @type"/>
                    <part>
                        <xsl:apply-templates/>
                    </part>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="corpname">
        <xsl:if test="normalize-space(.)">
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:text>ADDED CHILD ELEMENT part TO </xsl:text>
                    <xsl:value-of select="local-name()"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:element name="{local-name()}">
                <xsl:apply-templates select="@*"/>
                <xsl:for-each select="node()[position() = 1]">
                    <xsl:call-template name="corpnamePart"/>
                </xsl:for-each>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template name="corpnamePart">
        <part>
            <xsl:if test="local-name()='subarea'">
                <xsl:apply-templates select="@*"/>
                <xsl:attribute name="localtype" select="local-name()"/>
            </xsl:if>
            <xsl:call-template name="corpnameNode"/>
        </part>
        <xsl:if
            test="local-name()='subarea' or following-sibling::node()[1][local-name()='subarea']">
            <xsl:for-each select="following-sibling::node()[1]">
                <xsl:call-template name="corpnamePart"/>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template name="corpnameNode">
        <xsl:if
            test="normalize-space(.) or local-name()='ptr' or local-name()='extptr' or local-name()='lb'">
            <xsl:apply-templates select="."/>
        </xsl:if>
        <xsl:if
            test="following-sibling::node()[1][not(local-name()='subarea')] and not(local-name()='subarea')">
            <xsl:for-each select="following-sibling::node()[1]">
                <xsl:call-template name="corpnameNode"/>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template match="repository/subarea">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>CHANGED repository/</xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text> TO repository/corpname/part</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <corpname>
            <part localtype="subarea">
                <xsl:apply-templates select="@*"/>
                <xsl:apply-templates/>
            </part>
        </corpname>
    </xsl:template>
    
    <xsl:template match="imprint/publisher">
        <corpname relator="publisher">
            <xsl:apply-templates select="@*"/>
            <part>
                <xsl:apply-templates/>
            </part>
        </corpname>
    </xsl:template>


    <!-- ############################################### -->
    <!-- RENAMED ELEMENTS AND ATTRIBUTES                -->
    <!-- ############################################### -->
    
    <xsl:template match="@role">
        <xsl:choose>
            <xsl:when test="parent::corpname | parent::famname | parent::geogname | 
                parent::name | parent::persname | parent::genreform">
                <xsl:attribute name="relator">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test="parent::runner">
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="linkrole">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="@title">
        <xsl:attribute name="linktitle">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="@authfilenumber">
        <xsl:attribute name="identifier">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="unitdate[not(parent::label)][not(parent::did)][not(parent::unittitle)]">
        <date>
            <xsl:apply-templates select="node()"/>
        </date>
    </xsl:template>
    
    <xsl:template match="unitdate/@normal | date[not(parent::change) and not(ancestor::creation) and not(ancestor::chronlist)]/@normal">
        <xsl:attribute name="normal">
            <xsl:choose>
                <xsl:when test="contains(.,'/')">
                    <xsl:call-template name="fixNormalDateRange">
                        <xsl:with-param name="normalRangeValue">
                            <xsl:value-of select="."/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="fixNormalDate">
                        <xsl:with-param name="normalValue">
                            <xsl:value-of select="."/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>


    <!-- ############################################### -->
    <!--                  NOTES                          -->
    <!-- ############################################### -->

    <xsl:template
        match="did/note[p[title | persname | corpname | famname | name | geogname | genreform | subject | function | occupation | date | unitdate | blockqoute | chronlist | list | num | table]] | did/note[p[2]] | did/note[*[not(local-name()='p')]] | archdesc/note | descgrp/note | c/note | c01/note | c02/note | c03/note | c04/note | c05/note | c06/note | c07/note | c08/note | c09/note | c10/note | c11/note | c12/note">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT </xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:text>RENAMED as 'odd'</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <odd>
            <xsl:apply-templates select="@*[not(local-name()='label')]"/>
            <xsl:if test="@label">
                <head>
                    <xsl:value-of select="@label"/>
                </head>
            </xsl:if>
            <xsl:apply-templates/>
        </odd>
    </xsl:template>

    <xsl:template match="did/note[p][not(p[2])][not(*[not(local-name()='p')])][not(p[title | persname | corpname | famname | name | geogname | genreform | subject | function | occupation | date | unitdate | blockqoute | chronlist | list | num | table])]">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT </xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:text>RENAMED as 'didnote'</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <didnote>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </didnote>
    </xsl:template>

    <xsl:template match="notestmt/note">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT </xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:text>RENAMED as 'controlnote'</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <controlnote>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </controlnote>
    </xsl:template>
    
    <xsl:template match="entry/note | event/note | item/note | p/note | 
        archref/note | bibref/note | extref/note | extrefloc/note | ref/note | refloc/note">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT </xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:text>RENAMED as 'footnote'</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <footnote>
            <xsl:apply-templates select="@* except(@encodinganalog, @label)"/>
            <xsl:apply-templates/>
        </footnote>
    </xsl:template>
    
    <xsl:template match="accessrestrict/note | accruals/note | acqinfo/note | 
        altformavail/note | appraisal/note | arrangement/note | bibliography/note | 
        bioghist/note | blockquote/note | controlaccess/note | custodhist/note | 
        daodesc/note | dsc/note | fileplan/note | 
        index/note | note/note | odd/note | originalsloc/note | otherfindaid/note | 
        phystech/note | prefercite/note | processinfo/note | relatedmaterial/note | 
        scopecontent/note | separatedmaterial/note | userestrict/note | div/note | titlepage/note">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT </xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:text>WRAPPED in a paragraph and RENAMED as 'footnote'</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <p>
            <footnote>
                <xsl:apply-templates select="@* except(@encodinganalog, @label)"/>
                <xsl:apply-templates/>
            </footnote>
        </p>
    </xsl:template>

    <!-- ############################################### -->
    <!-- NAMESPACE STRIPPING ELEMENTS                    -->
    <!-- ############################################### -->

    <xsl:template match="*" mode="strip-ns">
        <!-- create new element using local name, in no namespace -->
        <xsl:element name="{local-name()}" namespace="" inherit-namespaces="no">
            <xsl:apply-templates select="@* | node()" mode="strip-ns"/>
        </xsl:element>
    </xsl:template>
    <!-- create new attribute using local name, in no namespace -->
    <xsl:template match="@*" mode="strip-ns">
        <xsl:attribute name="{local-name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    <!-- copy text, comment, and processing-instruction nodes -->
    <xsl:template match="text()|comment()|processing-instruction()" mode="strip-ns">
        <xsl:copy inherit-namespaces="no" copy-namespaces="no">
            <xsl:apply-templates select="node()" mode="strip-ns"/>
        </xsl:copy>
    </xsl:template>    
    
    <xsl:template match="@*[namespace-uri() = 'http://www.w3.org/1999/xlink'][not(local-name() = 'type')]" mode="strip-ns">
        <!--<xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>XLINK STRIPPED</xsl:text>
            </xsl:with-param>
        </xsl:call-template>-->
        <xsl:attribute name="{substring-after(name(), ':')}">
            <xsl:choose>
                <xsl:when test="local-name(.)='href'">
                    <xsl:value-of select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space(lower-case(.))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="@*[namespace-uri() = 'http://www.w3.org/1999/xlink'][local-name() = 'type']" mode="strip-ns"/>
    
    <xsl:template match="@linktype" mode="strip-ns"/>
    
    <xsl:template match="@*[namespace-uri() = 'http://www.w3.org/2001/XMLSchema-instance']" mode="strip-ns"/>
    
    <!--
    <xsl:template match="xlink:*" mode="strip-ns">
        <xsl:attribute name="{substring-after(name(), 6, )}" namespace="">
            <xsl:apply-templates/>
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@xsi:schemaLocation" mode="strip-ns"
        xpath-default-namespace="http://www.w3.org/2001/XMLSchema-instance"/>


    <xsl:template match="@*[starts-with(name(),'xlink')][name() != 'xlink:type']" mode="strip-ns">
        <xsl:message>XLINK STRIPPED</xsl:message>
        <xsl:attribute name="{substring-after(name(), ':')}">
            <xsl:value-of select="normalize-space(lower-case(.))"/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="@xlink:type[. = 'simple']" mode="strip-ns"/>

--> 
    
    <!-- ############################################### -->
    <!-- @TYPE TO @LOCALTYPE                             -->
    <!-- ############################################### -->

    <xsl:template
        match="notestmt/note/@type | did/note/@type | abstract/@type | materialspec/@type |
        accessrestrict/@type | altformavail/@type | archdesc/@type | container/@type |
        originalsloc/@type | phystech/@type | processinfo/@type | relatedmaterial/@type | separatedmaterial/@type | titleproper/@type | title/@type | unitid/@type | unittitle/@type |
        userestrict/@type | odd/@type | note/@type | date/@type | name/@type |  persname/@type | famname/@type |
        corpname/@type |  subject/@type |  occupation/@type | genreform/@type | function/@type | num/@type | physloc/@type | extent/@type | descgrp/@type">
        <xsl:attribute name="localtype">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>


    <!-- ############################################### -->
    <!-- LANGUAGE ATTRIBUTES                             -->
    <!-- ############################################### -->

    <xsl:template match="abstract/@langcode">
        <xsl:attribute name="lang">
            <xsl:value-of select="lower-case(.)"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="language/@langcode">
        <xsl:attribute name="{local-name()}" select="lower-case(.)"/>
    </xsl:template>
    
    
    <!-- ############################################### -->
    <!-- ADDRESS                                         -->
    <!-- ############################################### -->

    <xsl:template
        match="address[not(parent::repository) and not(parent::publicationstmt)]">
        <xsl:choose>
            <xsl:when
                test="not(parent::entry) 
                and not(parent::event) 
                and not(parent::extref)
                and not(parent::extrefloc)
                and not(parent::item)
                and not(parent::p) 
                and not(parent::ref)
                and not(parent::refloc)
                and not(parent::blockquote[parent::event])
                and not(parent::blockquote[parent::extref])
                and not(parent::blockquote[parent::extrefloc])
                and not(parent::blockquote[parent::item])
                and not(parent::blockquote[parent::p])
                and not(parent::blockquote[parent::ref])
                and not(parent::blockquote[parent::refloc])
                and not(parent::descgrp)">
                <xsl:element name="p">
                    <xsl:for-each select="addressline">
                        <xsl:apply-templates/>
                        <xsl:if test="position()!=last()">
                            <xsl:text>, </xsl:text>
                            <!--<xsl:element name="lb"/>-->
                        </xsl:if>
                    </xsl:for-each>
                </xsl:element>
            </xsl:when>
            <xsl:when test="parent::descgrp">
                <xsl:choose>
                    <xsl:when test="$outputUndeprecatedEAD3=false()">
                        <xsl:call-template name="commentAndMessage">
                            <xsl:with-param name="comment">
                                <xsl:call-template name="removedElement"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$outputUndeprecatedEAD3=true()">
                        <xsl:element name="p">
                            <xsl:for-each select="addressline">
                                <xsl:apply-templates/>
                                <xsl:if test="position()!=last()">
                                    <xsl:text>, </xsl:text>
                                    <!--<xsl:element name="lb"/>-->
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="addressline">
                    <xsl:apply-templates/>
                    <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- ############################################### -->
    <!-- LEGALSTATUS                                     -->
    <!-- ############################################### -->

    <xsl:template match="accessrestrict/legalstatus">
        <xsl:element name="p">
            <xsl:copy-of select="@*[not(local-name()='type')]"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- ############################################### -->
    <!-- UPDATE BOOLEAN TABLE ATTRS                      -->
    <!-- ############################################### -->

    <xsl:template match="@pgwide">
        <xsl:variable name="pgwideValue">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:attribute name="pgwide">
            <xsl:choose>
                <xsl:when test="$pgwideValue='1'">
                    <xsl:text>true</xsl:text>
                </xsl:when>
                <xsl:when test="$pgwideValue='0'">
                    <xsl:text>false</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="@colsep">
        <xsl:variable name="colsepValue">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:attribute name="colsep">
            <xsl:choose>
                <xsl:when test="$colsepValue='1'">
                    <xsl:text>true</xsl:text>
                </xsl:when>
                <xsl:when test="$colsepValue='0'">
                    <xsl:text>false</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="@rowsep">
        <xsl:variable name="rowsepValue">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:attribute name="rowsep">
            <xsl:choose>
                <xsl:when test="$rowsepValue='1'">
                    <xsl:text>true</xsl:text>
                </xsl:when>
                <xsl:when test="$rowsepValue='0'">
                    <xsl:text>false</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>


    <!-- process link attributes -->
    <!-- ############################################### -->
    <!-- LINK ELEMENTS and ATTRS                         -->
    <!-- ############################################### -->

    <xsl:template match="ref">
        <xsl:choose>
            <xsl:when
                test="parent::bibliography or 
                parent::otherfindaid or 
                parent::relatedmaterial or 
                parent::separatedmaterial">
                <p>
                    <xsl:call-template name="copyElement"/>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="copyElement"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="extref">
        <xsl:choose>
            <xsl:when
                test="parent::bibliography or 
                parent::otherfindaid or 
                parent::relatedmaterial or 
                parent::separatedmaterial">
                <p>
                    <ref>
                        <xsl:apply-templates select="@*"/>
                        <xsl:value-of select="."/>
                    </ref>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <ref>
                    <xsl:apply-templates select="@*"/>
                    <xsl:value-of select="."/>
                </ref>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="extptr">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT extptr CONVERTED TO ptr</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <ptr>
            <xsl:apply-templates select="@*"/>
        </ptr>
    </xsl:template>

    <xsl:template match="linkgrp">
        <xsl:choose>
            <xsl:when
                test="parent::bibliography or 
                parent::otherfindaid or 
                parent::relatedmaterial or 
                parent::separatedmaterial">
                <xsl:call-template name="commentAndMessage">
                    <xsl:with-param name="comment">
                        <xsl:text>ELEMENT </xsl:text>
                        <xsl:value-of select="local-name()"/>
                        <xsl:text>&#160;</xsl:text>
                        <xsl:text>REPLACED with 'p'</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <p>
                    <xsl:call-template name="decomposeLinkgrp"/>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="commentAndMessage">
                    <xsl:with-param name="comment">
                        <xsl:text>ELEMENT </xsl:text>
                        <xsl:value-of select="local-name()"/>
                        <xsl:text>&#160;</xsl:text>
                        <xsl:text>SKIPPED</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="decomposeLinkgrp"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="decomposeLinkgrp">
        <xsl:for-each select="extptrloc | ptrloc | extrefloc | refloc">
            <xsl:apply-templates select="."/>
            <xsl:if test="position()!=last()">, </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="extptrloc">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT </xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:text>RENAMED as 'ptr'</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <ptr>
            <xsl:apply-templates select="@*[not(local-name()='label')]"/>
        </ptr>
    </xsl:template>
    
    <xsl:template match="ptrloc">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT </xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:text>RENAMED as 'ptr'</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <ptr>
            <xsl:apply-templates select="@*[not(local-name()='label')]"/>
        </ptr>
    </xsl:template>
    
    <xsl:template match="extrefloc">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT </xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:text>RENAMED as 'ref'</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <ref>
            <xsl:apply-templates select="@*[not(local-name()='label')]"/>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    
    <xsl:template match="refloc">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT </xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:text>RENAMED as 'ref'</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <ref>
            <xsl:apply-templates select="@*[not(local-name()='label')]"/>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    
    <xsl:template match="@actuate | @show">
        <xsl:attribute name="{local-name()}" select="lower-case(.)"/>
    </xsl:template>


    <!-- ############################################### -->
    <!-- OTHER TEMPLATES                                 -->
    <!-- ############################################### -->

    <xsl:template name="removedElement">
        <xsl:text> ELEMENT OR ATTRIBUTE </xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>&#160;</xsl:text>
        <xsl:text>REMOVED FROM </xsl:text>
        <xsl:value-of select="parent::*/local-name()"/>
        <xsl:text>. </xsl:text>
    </xsl:template>

    <xsl:template name="commentAndMessage">
        <xsl:param name="comment"/>
        <xsl:if test="$addMigrationComments=true()">
            <xsl:comment><xsl:value-of select="$comment"/></xsl:comment>
        </xsl:if>
        <xsl:if test="$addMigrationMessages=true()">
            <xsl:message>
                <xsl:value-of select="$comment"/>
            </xsl:message>
        </xsl:if>
    </xsl:template>

    <xsl:template name="nowOdd">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT </xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:text>RENAMED as 'odd'</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:element name="odd">
            <xsl:copy-of select="@* except @type"/>
            <xsl:attribute name="localtype" select="@type"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    
</xsl:stylesheet>
