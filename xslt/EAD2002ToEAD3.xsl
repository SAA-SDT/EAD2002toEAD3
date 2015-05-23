<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsi xd xlink"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://ead3.archivists.org/schema/"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 27, 2012</xd:p>
            <xd:p>
                <xd:b>Last Updated: 2015-04-20</xd:b>
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

    <!-- user parameter to control deprecation -->
    <xsl:param name="outputUndeprecatedEAD3" select="false()"/>

    <!-- user parameter to control migration comments -->
    <xsl:param name="addMigrationComments" select="true()"/>

    <!-- user parameter to control migration messages -->
    <xsl:param name="addMigrationMessages" select="true()"/>

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
            <xsl:when test="$outputUndeprecatedEAD3=false()">
                <xsl:processing-instruction name="xml-model">
            <xsl:text>href="../../ead3.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
        </xsl:processing-instruction>
                <xsl:processing-instruction name="oxygen">
            <xsl:text>RNGSchema="../../ead3.rng" type="xml"</xsl:text>
        </xsl:processing-instruction>
            </xsl:when>
            <xsl:when test="$outputUndeprecatedEAD3=true()">
                <xsl:processing-instruction name="xml-model">
            <xsl:text>href="../../ead_revised_undeprecated.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
        </xsl:processing-instruction>
                <xsl:processing-instruction name="oxygen">
            <xsl:text>RNGSchema="../../ead_revised_undeprecated.rng" type="xml"</xsl:text>
        </xsl:processing-instruction>
            </xsl:when>
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
        <xsl:element name="{local-name()}" namespace="{$eadxmlns}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="element()">
        <xsl:call-template name="copyElement"/>
    </xsl:template>

    <!-- copy attributes, text, comments, and processing instructions -->
    <xsl:template match="attribute()|text()|comment()|processing-instruction()">
        <xsl:copy/>
    </xsl:template>

    <!--  need to add in the new xmlns, starting with the root ead element -->
    <!-- xsl:template match="ead">
        <ead>
            <xsl:apply-templates select="@*|node()"/> 
        </ead>
    </xsl:template -->

    <!-- ############################################### -->
    <!-- DEPRECATED ELEMENTS                             -->
    <!-- ############################################### -->

    <!-- REMOVE COMPLETELY IF NOT UNDEPRECATED -->
    <xsl:template
        match="frontmatter | runner | descgrp/address | descgrp/blockquote | descgp/descgrp | descgrp/head  | descgrp/list | descgrp/p | descgrp/tabledescgrp/address | descgrp/blockquote | descgp/descgrp | descgrp/head  | descgrp/list | descgrp/p | descgrp/table | @tpattern">
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

    <!-- REMOVE COMPLETELY -->
    <xsl:template
        match="arc | resource | ead/@xsi:schemaLocation | 
        custodhist//acqinfo/head | scopecontent//arrangement/head | 
        event/blockquote/chronlist | extref/blockquote/chronlist | extrefloc/blockquote/chronlist | 
        item/blockquote/chronlist | p/blockquote/chronlist | ref/blockquote/chronlist | refloc/blockquote/chronlist | 
        event/blockquote/list | extref/blockquote/list | extrefloc/blockquote/list | item/blockquote/list | 
        p/blockquote/list | ref/blockquote/list | refloc/blockquote/list | 
        event/blockquote/table | extref/blockquote/table | extrefloc/blockquote/table | 
        item/blockquote/table | p/blockquote/table | ref/blockquote/table | refloc/blockquote/table | 
        notestmt/note/@actuate | notestmt/note/@show | notestmt/note/@label | 
        did/note/@actuate | did/note/@show | did/note[(p[2] or child::*[local-name()!=p])]/@label | @linktype | namegrp/note">
        <xsl:if test="node()=element()">
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:call-template name="removedElement"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
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
        archref/dao | archref/daogrp |
        archref/langmaterial | archref/materialspec |
        archref/origination | archref/physdesc |
        archref/physloc | archref/repository |
        archref/unitdate | archref/unitid |
        archref/unittitle |
        bibref/archref | bibref/edition |
        subtitle/date | subtitle/num |
        corpname/subarea | emph/title | 
        item/repository | item/unittitle | 
        custodhist//acqinfo | scopecontent//arrangement |
        materialspec/num | materialspec/materialspec |  
        entry/origination | entry/repository |
        event/origination | event/repository |
        extref/origination | extref/repository |
        extrefloc/origination | extrefloc/repository |
        item/origination | item/repository |
        label/origination | label/repository |
        p/origination | p/repository |
        ref/origination | ref/origination |
        refloc/origination | refloc/origination |
        origination/title | repository/title |
        
        unittitle[parent::* except (//did)] | langusage | language[parent::langusage] | descrules |
        container/title |
        unitdate/title | unitid/title | physloc/title | did/note[not(p[2])][not(child::*[local-name()!=p])]/p | 
        event/blockquote/p | extref/blockquote/p | extrefloc/blockquote/p | 
        item/blockquote/p | p/blockquote/p | ref/blockquote/p | refloc/blockquote/p">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:call-template name="removedElement"/>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates/>
    </xsl:template>

    <!-- archref and bibref -->

    <xsl:template
        match="archref[not(parent::separatedmaterial)][not(parent::relatedmaterial)][not(parent::otherfindaid)][not(parent::bibliography)][not(parent::bibref)]">
        <ref>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <xsl:template
        match="bibref[not(parent::separatedmaterial)][not(parent::relatedmaterial)][not(parent::otherfindaid)][not(parent::bibliography)]">
        <ref>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <xsl:template match="archref[not(parent::bibref)][parent::bibliography or parent::otherfindaid or parent::relatedmaterial or parent::separatedmaterial] | 
        bibref[parent::bibliography or parent::otherfindaid or parent::relatedmaterial or parent::separatedmaterial]">
        <xsl:element name="{local-name()}">
            <xsl:copy-of
                select="@* except(@actuate, @arcrole, @href, @linktype, @role, @show, @title, @xpointer)"/>
            <xsl:choose>
                <xsl:when test="@actuate | @arcrole | @href | @linktype | @role | @show | @title | @xpointer">
                    <ref>
                        <xsl:apply-templates
                            select="@actuate, @arcrole, @href, @linktype, @role, @show, @title, @xpointer"/>
                        <xsl:apply-templates/>
                    </ref>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>

    <!-- descgrp orphan elements -->

    <!--<xsl:template
        match="descgrp/address | descgrp/blockquote | descgp/descgrp | descgrp/head  | descgrp/list | descgrp/p | descgrp/table">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:call-template name="removedElement"/>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:comment>
            <xsl:apply-templates/>
        </xsl:comment>
    </xsl:template>-->

    <!-- ############################################### -->
    <!-- REVISED CONTENT MODELS                          -->
    <!-- ############################################### -->


    <!-- m.refs from container -->
    <!--
    <xsl:template
        match="container/ref | container/extref | container/linkgrp | container/bibref | container/title | container/archref">
        <xsl:comment>
            <xsl:call-template name="removedElement"/>
        </xsl:comment>
        <xsl:message>
            <xsl:call-template name="removedElement"/>
        </xsl:message>
    </xsl:template>
-->



    <!-- ############################################### -->
    <!-- type attributes                            -->
    <!-- ############################################### -->

    <xsl:template match="dsc/@type | unitdate/@type">
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
            <xsl:copy-of select="@*[not(local-name()='findaidstatus')]"/>

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
                    <xsl:copy-of select="eadid/@countrycode"/>
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
                                        test="profiledesc/creation/date/@normal[not(contains(.,'/'))]">
                                        <xsl:attribute name="standarddatetime">
                                            <xsl:value-of select="profiledesc/creation/date/@normal"
                                            />
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
                            <xsl:if test="date/@normal[not(contains(.,'/'))]">
                                <xsl:attribute name="standarddatetime">
                                    <xsl:value-of select="date/@normal"/>
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
                            <xsl:copy-of select="@* except @scriptcode"/>
                            <xsl:value-of select="."/>
                        </language>
                        <xsl:variable name="scriptCode"
                            select="if (@scriptcode[normalize-space(.)])then @scriptcode else'SCRIPTCODE NEEDED'"/>
                        <script scriptcode="{$scriptCode}">
                                <xsl:value-of select="$scriptCode"/>
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

    <xsl:template match="chronlist">
        <xsl:call-template name="gonna-deal-with-this-later"/>
    </xsl:template>

    <!-- ############################################### -->
    <!-- LIST                                            -->
    <!-- ############################################### -->
    
    <!-- Which instances of list to exclude? daodesc, descgrp, extref, extrefloc, ref, refloc, revisiondesc -->
    <xsl:template match="list">
        <list>
            <xsl:apply-templates select="@* except (@type)"/>
            <xsl:if test="@type">
                <xsl:attribute name="listtype" select="replace(@type, 'simple', 'unordered')"/>
            </xsl:if>
            <xsl:apply-templates select="*"/>
        </list>
    </xsl:template>

    <xsl:template match="item">
        <item>
            <xsl:apply-templates select="node() except (chronlist, table)"/>
        </item>
    </xsl:template>





    <!-- ############################################### -->
    <!-- DID ELEMENTS                                    -->
    <!-- ############################################### -->

    <xsl:template match="did">
        <did>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates
                select="*[not(local-name()='note' and (p[2] or child::*[local-name()!=p]))]"/>
            <xsl:apply-templates
                select="parent::*/dao | parent::*/daogrp | child::dao | child::daogrp | parent::*/scopecontent//dao | parent::*/bioghist//dao | parent::*/odd//dao | parent::*/scopecontent//daogrp | parent::*/bioghist//daogrp | parent::*/odd//daogrp"
                mode="daoIndid"/>
        </did>
        <xsl:apply-templates select="*[local-name()='note' and (p[2] or child::*[local-name()!=p])]"
        />
    </xsl:template>

    <xsl:template match="dao[not(parent::did)] | daogrp[not(parent::did)]">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment" select="'dao or daogrp outside did moved into did'"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="dao[parent::did] | daogrp[parent::did]"> </xsl:template>

    <xsl:template match="daogrp[count(child::daoloc) &gt; 1]" mode="daoIndid">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment" select="'daogrp now daoset'"/>
        </xsl:call-template>
        <daoset>
            <xsl:apply-templates select="daoloc"/>
            <xsl:apply-templates select="daodesc"/>
        </daoset>
    </xsl:template>

    <xsl:template match="daogrp[count(child::daoloc) = 1]" mode="daoIndid">
        <xsl:comment>daogrp[count(child::daoloc) = 1]</xsl:comment>
        <xsl:comment>moving dao* outside did into did</xsl:comment>
        <xsl:comment>daogrp with single daoloc now dao</xsl:comment>
        <xsl:comment>dao now requires attribute "daotype"; setting value to "unknown"</xsl:comment>
        <dao>
            <!-- why does this not work? -->
            <!--<xsl:copy-of select="daoloc/@* except (@role, @title)"/> -->
            <xsl:copy-of
                select="daoloc/@*[name() != 'role' and name() != 'title' and name() != 'linktype']"/>
            <xsl:attribute name="daotype">
                <xsl:text>unknown</xsl:text>
            </xsl:attribute>
            <!--
            <xsl:attribute name="linktype">
                <xsl:text>simple</xsl:text>
            </xsl:attribute>
            -->
            <xsl:attribute name="linkrole">
                <xsl:value-of select="daoloc/@role"/>
            </xsl:attribute>
            <xsl:apply-templates select="daodesc"/>
        </dao>
    </xsl:template>

    <xsl:template match="dao" mode="daoIndid">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>added required attribute daotype with value "unknown"</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <dao>
            <xsl:attribute name="daotype">
                <xsl:text>unknown</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates select="@* except (@role) "/>
            <xsl:attribute name="linkrole">
                <xsl:value-of select="daoloc/@role"/>
            </xsl:attribute>
            <xsl:apply-templates select="child::*"/>
        </dao>
    </xsl:template>

    <xsl:template match="daoloc">
        <xsl:comment>daoloc</xsl:comment>
        <dao>
            <xsl:copy-of select="daoloc/@* except (@title, @role)"/>
            <xsl:attribute name="daotype">
                <xsl:text>unknown</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="linkrole">
                <xsl:value-of select="daoloc/@role"/>
            </xsl:attribute>
            <xsl:apply-templates select="child::*"/>
        </dao>
    </xsl:template>

    <xsl:template match="dao/@role">
        <xsl:attribute name="linkrole">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="origination">
        <origination>
            <xsl:apply-templates select="@*"/>
            <xsl:choose>
                <xsl:when test="not(text()[normalize-space(.)]) and not(*[not(local-name()='persname')][not(local-name()='corpname')][not(local-name()='famname')][not(local-name()='name')])">
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:when test="not(persname | corpname | famname | name)">
                    <name>
                        <part>
                            <xsl:apply-templates/>
                        </part>
                    </name>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="*[local-name()='persname' 
                        or local-name()='corpname' 
                        or local-name()='famname' 
                        or local-name()='name']"/>
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>Before migration the entire text of this origination was as follows:
                            "</xsl:text><xsl:value-of select="normalize-space(.)"/><xsl:text>"
                            Portions not included in persname, corpname, famname, or name elements were lost.</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </origination>
    </xsl:template>

    <!-- keep contents of unitdate, move unitdate element outside unittitle -->
    <xsl:template match="unittitle[parent::did]">
        <unittitle>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </unittitle>
        <xsl:if test="$outputUndeprecatedEAD3=false()">
            <xsl:for-each select="unitdate">
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
                <xsl:when test="not(corpname | subarea | name | address)">
                    <name>
                        <part>
                            <xsl:apply-templates/>
                        </part>
                    </name>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="*[local-name()='corpname' 
                        or local-name()='subarea' 
                        or local-name()='name' 
                        or local-name()='address']"/>
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>Before migration the entire text of this repository was as follows:
                            "</xsl:text><xsl:value-of select="normalize-space(.)"/><xsl:text>"
                            Portions not included in corpname, subarea, name, or address elements were lost.</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </repository>
    </xsl:template>

    <!-- script attr becomes script element -->
    <xsl:template match="langmaterial">
        <langmaterial>

            <xsl:apply-templates select="language[@scriptcode]" mode="languageset"/>
            <xsl:apply-templates select="language[not(@scriptcode)]"/>

            <descriptivenote>
                <p>
                    <xsl:apply-templates select="./text() | abbr | emph | expan | lb | ref | ptr"/>
                </p>
            </descriptivenote>
        </langmaterial>
    </xsl:template>

    <xsl:template match="language" mode="languageset">
        <languageset>
            <xsl:element name="language">
                <xsl:apply-templates select="@* except @scriptcode"/>
                <xsl:apply-templates/>
            </xsl:element>
            <script scriptcode="{@scriptcode}"/>
        </languageset>
    </xsl:template>




    <!-- ############################################### -->
    <!-- NAMES  AND CONTROLLACCESS                       -->
    <!-- ############################################### -->

    <xsl:template
        match="famname | persname | name | subject | occupation | geogname | function | genreform">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ADDED CHILD ELEMENT part TO </xsl:text>
                <xsl:value-of select="local-name()"/>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:element name="{local-name()}" namespace="{$eadxmlns}">
            <xsl:apply-templates select="@*"/>
            <part>
                <xsl:apply-templates/>
            </part>
        </xsl:element>
    </xsl:template>

    <xsl:template match="title">

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
            <xsl:otherwise>
                <xsl:call-template name="titleLinkDecomposeAddPart"/>
            </xsl:otherwise>
        </xsl:choose>
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
                test="(@actuate or @xlink:actuate
                or @arcrole or @xlink:arcrole
                or @href or @xlink:href
                or @show or @xlink:show
                or @title or @xlink:title
                or @entityref or @xpointer)
                and not(parent::controlaccess)">
                <ref>
                    <xsl:apply-templates
                        select="@actuate | @xlink:actuate
                        | @arcrole | @xlink:arcrole
                        | @href | @xlink:href
                        | @show | @xlink:show
                        | @title | @xlink:title
                        | @entityref | @xpointer"/>
                    <xsl:element name="{local-name()}" namespace="{$eadxmlns}">
                        <xsl:apply-templates
                            select="@altrender | @audience
                            | @authfilenumber | @encodinganalog
                            | @id | @normal
                            | @render | @rules
                            | @role | @xlink:role
                            | @source | @type"/>
                        <part>
                            <xsl:apply-templates/>
                        </part>
                    </xsl:element>
                </ref>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{local-name()}" namespace="{$eadxmlns}">
                    <xsl:apply-templates
                        select="@altrender | @audience
                        | @authfilenumber | @encodinganalog
                        | @id | @normal
                        | @render | @rules
                        | @role | @xlink:role
                        | @source | @type"/>
                    <part>
                        <xsl:apply-templates/>
                    </part>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--<xsl:template name="refDecompose">
        <ref>
            <xsl:apply-templates select="@actuate | @xlink:actuate
                | @arcrole | @xlink:arcrole
                | @href | @xlink:href
                | @role | @xlink:role
                | @show | @xlink:show
                | @title | @xlink:title
                | @entityref
                | @xpointer">
            </xsl:apply-templates>
            <xsl:element name="{local-name()}" namespace="{$eadxmlns}">
                <xsl:apply-templates select="@*"/>
                <xsl:apply-templates/>
            </xsl:element>
        </ref>
    </xsl:template>-->

    <xsl:template match="corpname">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ADDED CHILD ELEMENT part TO </xsl:text>
                <xsl:value-of select="local-name()"/>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:element name="{local-name()}" namespace="{$eadxmlns}">
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="node()[position()=1]">
                <xsl:call-template name="corpnamePart"/>
            </xsl:for-each>
        </xsl:element>
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


    <!-- ############################################### -->
    <!-- RENAMED ELEMENTS AND ATTRIBUTES                -->
    <!-- ############################################### -->

    <!-- the archaic add -->
    <!--<xsl:template match="add">
        <xsl:call-template name="nowOdd"/>
    </xsl:template>-->

    <xsl:template
        match="*[self::* except (//dao, //ref, //extref, //title, //archref, //bibref)]/@role">
        <xsl:attribute name="relator">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="*/@authfilenumber">
        <xsl:attribute name="identifier">
            <xsl:value-of select="."/>
        </xsl:attribute>
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

    <xsl:template match="item/unitdate">
        <date>
            <xsl:apply-templates select="node()"/>
        </date>
    </xsl:template>


    <!-- ############################################### -->
    <!--                  NOTES                          -->
    <!-- ############################################### -->

    <xsl:template
        match="did/note[p[2] or child::*[local-name()!=p]] | archdesc/note | descgrp/note | c/note | c01/note | c02/note | c03/note | c04/note | c05/note | c06/note | c07/note | c08/note | c09/note | c10/note | c11/note | c12/note">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>ELEMENT </xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:text>RENAMED as 'odd'</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:element name="odd" namespace="{$eadxmlns}" xmlns="urn:isbn:1-931666-22-9">
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="did/note[p][not(p[2])][not(child::*[local-name()!=p])]">
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
    
    <xsl:template match="@*[namespace-uri() = 'http://www.w3.org/1999/xlink']" mode="strip-ns">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>XLINK STRIPPED</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:attribute name="{substring-after(name(), ':')}">
            <xsl:value-of select="normalize-space(lower-case(.))"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="@*[namespace-uri() = 'http://www.w3.org/1999/xlink'][local-name() = 'type']" mode="strip-ns"/>
    
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
        userestrict/@type | odd/@type | date/@type | name/@type |  persname/@type | famname/@type |
        corpname/@type |  subject/@type |  occupation/@type | genreform/@type | function/@type | num/@type | physloc/@type">
        <xsl:attribute name="localtype">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>


    <!-- ############################################### -->
    <!-- LANGUAGE ATTRIBUTES                             -->
    <!-- ############################################### -->

    <xsl:template match="abstract/@langcode">
        <xsl:attribute name="lang">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    
    <!-- ############################################### -->
    <!-- ADDRESS                                         -->
    <!-- ############################################### -->

    <xsl:template
        match="address[not(parent::repository) and not(parent::publicationstmt) and not(parent::descgrp)]">
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
                and not(parent::blockquote[parent::refloc])">
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
                <p>
                    <!-- Figure out what to do with linkgrp -->
                </p>
            </xsl:when>
            <xsl:otherwise>
                <!-- Figure out what to do with linkgrp -->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- ############################################### -->
    <!-- OTHER TEMPLATES                                 -->
    <!-- ############################################### -->

    <xsl:template name="removedElement">
        <xsl:text> ELEMENT </xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>&#160;</xsl:text>
        <xsl:text>REMOVED FROM </xsl:text>
        <xsl:value-of select="parent::*/local-name()"/>
        <xsl:text> </xsl:text>
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
        <xsl:element name="odd" namespace="{$eadxmlns}" xmlns="urn:isbn:1-931666-22-9">
            <xsl:copy-of select="@* except @type"/>
            <xsl:attribute name="localtype" select="@type"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="gonna-deal-with-this-later">
        <xsl:comment>
            <xsl:text>NOT GONNA DEAL WITH</xsl:text>
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>&#160;</xsl:text>
            <xsl:text>NOW</xsl:text>
            <xsl:text>&#10;</xsl:text>
        </xsl:comment>
    </xsl:template>

</xsl:stylesheet>
