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
                <xd:b>Last Updated: 2014-11-14</xd:b>
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
    <xsl:param name="eventtypeValue" select="'derived'"/>

    <!-- user parameter for control/agenttype -->
    <!-- agenttype enumeration '[human, machine, unknown]' -->
    <xsl:param name="agenttypeValue" select="'machine'"/>
    
    <!-- user parameter for control/maintenancehistory/maintenanceevent/agent -->
    <xsl:param name="agent">
        <xsl:text>EAD 2002 to EAD3 Migration Style Sheet(EAD2002ToEAD3.xsl)</xsl:text>
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
        <xsl:processing-instruction name="xml-model">
            <xsl:text>href="../../ead3.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
        </xsl:processing-instruction>
        <xsl:processing-instruction name="oxygen">
            <xsl:text>RNGSchema="../../ead3.rng" type="xml"</xsl:text>
        </xsl:processing-instruction>
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


    <xsl:template match="element()">
        <xsl:element name="{local-name()}" namespace="http://ead3.archivists.org/schema/">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>

    <!-- copy the attributes -->
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

    <!-- REMOVE COMPLETELY -->
    <xsl:template
        match="frontmatter | runner | accessrestrict/legalstatus| archdesc/address | dsc/address | @linktype | arc | resource">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:call-template name="removedElement"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- SKIP ELEMENT OR ATTRIBUTE -->
    <xsl:template
        match="descgrp | admininfo | titleproper/date | titleproper/num | dimensions | physfacet | extent |
        accessrestrict/accessrestrict/legalstatus | archref/abstract | subtitle/date | 
        subtitle/num | subarea | bibseries | imprint | bibref/edition | bibref/publisher | emph/* | abbr/* | expan/* | 
        unittitle[parent::* except (//did)] | langusage | language[parent::langusage] | descrules | ead/@xsi:schemaLocation | 
        notestmt/note/@actuate | notestmt/note/@show | notestmt/note/@label">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:call-template name="removedElement"/>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates/>
    </xsl:template>

    <!-- bibref -->

    <xsl:template
        match="bibref[parent::* except (separatedmaterials, relatedmaterials, otherfindaid, bibliography)]">
        <ref>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <!-- descgrp orphan elements -->

    <xsl:template
        match="descgrp/address | descgrp/blockquote | descgp/descgrp | descgrp/head  | descgrp/list | descgrp/p | descgrp/table">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:call-template name="removedElement"/>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:comment>
            <xsl:apply-templates/>
        </xsl:comment>
    </xsl:template>

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

    <xsl:template match="dsc/@type | list/@type| unitdate/@type">
        <xsl:attribute name="{parent::*/local-name()}type" select="string(.)"/>
    </xsl:template>

    <!-- ############################################### -->
    <!-- EADHEADER to CONTROL -->
    <!-- ############################################### -->

    <xsl:template match="eadheader">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>eadheader replaced by control</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <control>
            <xsl:copy-of select="@*[not(local-name()='findaidstatus')]"/>

            <xsl:apply-templates select="eadid"/>

            <xsl:apply-templates select="filedesc"/>

            <maintenancestatus value="{$maintenancestatusValue}"/>

            <xsl:if test="normalize-space($publicationstatusValue)">
                <publicationstatus value="{$publicationstatusValue}"/>
            </xsl:if>

            <maintenanceagency>
                <xsl:if test="eadid/@countrycode">
                    <xsl:copy-of select="eadid/@countrycode"/>
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>eadid/@countrycode replaced with maintenanceagency/@countrycode</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
                <xsl:if test="eadid/@mainagencycode">
                    <agencycode>
                        <xsl:value-of select="eadid/@mainagencycode"/>
                    </agencycode>
                    <xsl:call-template name="commentAndMessage">
                        <xsl:with-param name="comment">
                            <xsl:text>eadid/@mainagencycode replaced with maintenanceagency/agencycode</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
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
                        <xsl:text>@findaidstatus migrated to localcontrol/term but superseded by maintenancestatus</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
                <localcontrol localtype="findaidstatus">
                    <term>
                        <xsl:value-of select="@findaidstatus"/>
                    </term>
                </localcontrol>
            </xsl:if>

            <maintenancehistory>
                <xsl:copy-of select="revisiondesc/@*"/>
                <maintenanceevent>
                    <eventtype value="{$eventtypeValue}"/>
                    <eventdatetime standarddatetime="{current-dateTime()}">
                        <xsl:value-of select="current-dateTime()"/>
                    </eventdatetime>
                    <agenttype value="{$agenttypeValue}"/>
                    <agent><xsl:value-of select="$agent"/></agent>
                </maintenanceevent>
                <xsl:if test="profiledesc/creation">
                    <maintenanceevent>
                        <xsl:copy-of select="profiledesc/creation/@*"/>
                        <eventtype value="created"/>
                        <eventdatetime>
                            <xsl:choose>
                                <xsl:when
                                    test="profiledesc/creation/date and not(profiledesc/creation/date[2])">
                                    <xsl:copy-of select="profiledesc/creation/date/@*[not(local-name()='calendar') and not(local-name()='era') and not(local-name()='certainty') and not(local-name()='type') and not(local-name()='normal')]"/>
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
                    <maintenanceevent>
                        <xsl:copy-of select="@*"/>
                        <eventtype value="unknown"/>
                        <eventdatetime>
                            <xsl:copy-of select="date/@*[not(local-name()='calendar') and not(local-name()='era') and not(local-name()='certainty') and not(local-name()='type') and not(local-name()='normal')]"/>
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
                <xsl:text>eadid converted to recordid</xsl:text>
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
                    <xsl:text>eadid/@publicid converted to otherrecordid</xsl:text>
                </xsl:with-param>
            </xsl:call-template>
            <otherrecordid localtype="publicid">
                <xsl:value-of select="@publicid"/>
            </otherrecordid>
        </xsl:if>
        <xsl:if test="@identifier">
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:text>eadid/@identifier converted to otherrecordid</xsl:text>
                </xsl:with-param>
            </xsl:call-template>
            <otherrecordid localtype="identifier">
                <xsl:value-of select="@identifier"/>
            </otherrecordid>
        </xsl:if>
        <xsl:if test="@url">
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:text>eadid/@url converted to otherrecordid</xsl:text>
                </xsl:with-param>
            </xsl:call-template>
            <otherrecordid localtype="url">
                <xsl:value-of select="@url"/>
            </otherrecordid>
        </xsl:if>
        <xsl:if test="@urn">
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment">
                    <xsl:text>eadid/@urn converted to otherrecordid</xsl:text>
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
                    <languagedeclaration>
                        <xsl:choose>
                            <xsl:when test="../language[2]">
                                <xsl:apply-templates select="/ead//langusage/@*[not(local-name()='id')]"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="/ead//langusage/@*"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <language>
                            <xsl:copy-of select="@*[not(local-name()='scriptcode')]"/>
                            <xsl:value-of select="."/>
                        </language>
                        <script scriptcode="{@scriptcode}">
                                <xsl:value-of select="@scriptcode"/>
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
                    <conventiondeclaration>
                        <xsl:choose>
                            <xsl:when test="../title[2]">
                                <xsl:apply-templates select="/ead//descrules/@*[not(local-name()='id')]"/>
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
                    <xsl:apply-templates select="p" mode="skipP"/>
                    <xsl:for-each select="address | chronlist | list | note | table">
                        <xsl:comment>
                            <xsl:call-template name="blockquoteOrphanElements"/>
                        </xsl:comment>
                        <xsl:comment>
                            <xsl:apply-templates/>
                        </xsl:comment>
                    </xsl:for-each>
                </xsl:element>
            </xsl:when>
            <xsl:when test="parent::archdesc | parent::admininfo | parent::descgrp">
                <xsl:call-template name="nowOdd"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="blockquote">
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates/>
                </xsl:element>
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

    <xsl:template match="list">
        <list>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="*"/>
        </list>
    </xsl:template>

    <!-- ############################################### -->
    <!-- TABLE                                           -->
    <!-- ############################################### -->


    <xsl:template match="table">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- ############################################### -->
    <!-- DID ELEMENTS                                    -->
    <!-- ############################################### -->
    <!-- origination:
     when child *name is present:   
        create origination for each *name element
        put all text in a comment
      otherwise:
      put all text in <name>/<part>
-->

    <xsl:template match="did">
        <did>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
            <xsl:apply-templates
                select="parent::*/dao | parent::*/daogrp | child::dao | child::daogrp | parent::*/scopecontent//dao | parent::*/bioghist//dao | parent::*/odd//dao | parent::*/scopecontent//daogrp | parent::*/bioghist//daogrp | parent::*/odd//daogrp"
                mode="daoIndid"/>
        </did>
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
            <xsl:attribute name="coverage">
                <xsl:text>unknown</xsl:text>
            </xsl:attribute>
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
            <xsl:copy-of select="daoloc/@*[name() != 'role' and name() != 'title']"/>
            <xsl:attribute name="daotype">
                <xsl:text>unknown</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="linktype">
                <xsl:text>simple</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="linkrole">
                <xsl:value-of select="daoloc/@role"/>
            </xsl:attribute>
            <xsl:apply-templates select="daodesc"/>
        </dao>
    </xsl:template>

    <xsl:template match="dao" mode="daoIndid">
        <xsl:comment>dao</xsl:comment>
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


    <!-- if content is only a name element - copy and apply-templates
     if only text content: create name/part element with entire text inside
     if text and name elements ?
-->
    <xsl:template match="origination">
        <origination>
            <!--        <xsl:for-each select="corpname | name | persname | famname">            
                <xsl:apply-templates select="self::*"/>
                <xsl:comment>
                    <xsl:value-of select="parent::origination//text()"/>
                </xsl:comment>         
        </xsl:for-each>
        
                -->
            <xsl:call-template name="commentAndMessage">
                <xsl:with-param name="comment" select="'ORIGINATION NEEDS WORK'"/>
            </xsl:call-template>
        </origination>

    </xsl:template>




    <!-- keep contents of unitdate, move unitdate element outside unittitle -->
    <xsl:template match="unittitle[parent::did]">
        <unittitle>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="child::node() except (unitdate)"/>
        </unittitle>
        <xsl:apply-templates select="unitdate"/>
    </xsl:template>

    <xsl:template match="unitdate[parent::did]">
        <unitdate>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="child::node() except (unitdate)"/>
        </unitdate>
    </xsl:template>


    <xsl:template match="repository">

        <repository>
            <xsl:if test="empty(corpname | name | persname | famname)">
                <name>
                    <part>
                        <xsl:value-of select="descendant::addressline[1]"/>
                    </part>
                </name>
            </xsl:if>
            <xsl:apply-templates select="corpname | name | persname | famname | address"/>
            <xsl:comment>
                <xsl:value-of select=".//text()"/>
            </xsl:comment>
        </repository>
    </xsl:template>

    <!--
    <xsl:template match="physdesc">
        <physdesc>
            <xsl:apply-templates/>
        </physdesc>
    </xsl:template>
-->

    <!-- script attr becomes script element -->
    <xsl:template match="langmaterial">
        <langmaterial>
            <xsl:choose>
                <xsl:when test="count(child::language) &gt; 1">
                    <languageset>
                        <xsl:apply-templates select="language"/>
                    </languageset>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="language"/>
                </xsl:otherwise>
            </xsl:choose>
            <descriptivenote>
                <p>
                    <xsl:apply-templates select="./text() | abbr | emph | expan | lb | ref | ptr"/>
                </p>
            </descriptivenote>
        </langmaterial>
    </xsl:template>




    <!-- ############################################### -->
    <!-- NAMES  AND CONTROLLACCESS                       -->
    <!-- ############################################### -->

    <xsl:template
        match="corpname | famname | persname | name | subject | occupation | geogname | function | title | genreform">
        <xsl:call-template name="commentAndMessage">
            <xsl:with-param name="comment">
                <xsl:text>Added child part element to </xsl:text>
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




    <!-- ############################################### -->
    <!-- RENAMED ELEMENTS AND ATTRIBUTES                -->
    <!-- ############################################### -->

    <!-- the archaic add -->
    <xsl:template match="add">
        <xsl:call-template name="nowOdd"/>
    </xsl:template>

    <xsl:template match="*[parent::* except (//dao, //ref, //extref)]/@role">
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
                <xsl:text>RENAMED as 'descriptivenote'</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <descriptivenote>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </descriptivenote>
    </xsl:template>




    <!-- ############################################### -->
    <!--                  NOTES                          -->
    <!-- ############################################### -->

    <xsl:template
        match="c/note | archdesc/note | descgrp/note | c01/note | c02/note | c03/note | c04/note | c05/note | c06/note | c07/note | c08/note | c09/note | c10/note | c11/note | c12/note">
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
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="did/note">
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
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="p" mode="skipP"/>
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
        <xsl:element name="{local-name()}" namespace="" inherit-namespaces="no">
            <xsl:apply-templates select="@* | node()" mode="strip-ns"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="@*|text()|comment()|processing-instruction()" mode="strip-ns">
        <xsl:copy inherit-namespaces="no" copy-namespaces="no">
            <xsl:apply-templates select="@*|node()" mode="strip-ns"/>
        </xsl:copy>
    </xsl:template>
    <!--
    <xsl:template match="xlink:*" mode="strip-ns">
        <xsl:attribute name="{substring-after(name(), 6, )}" namespace="">
            <xsl:apply-templates/>
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@xsi:schemaLocation" mode="strip-ns"
        xpath-default-namespace="http://www.w3.org/2001/XMLSchema-instance"/>
-->

    <!-- ############################################### -->
    <!-- @TYPE TO @LOCALTYPE                             -->
    <!-- ############################################### -->

    <xsl:template
        match="notestmt/note/@type | abstract/@type | accessrestrict/@type | altformavail/@type | archdesc/@type | container/@type |
        phystech/@type | processinfo/@type | titleproper/@type | title/@type | unitid/@type | unittitle/@type |
        userestrict/@type | odd/@type | date/@type | name/@type |  persname/@type | famname/@type |
        corpname/@type |  subject/@type |  occupation/@type | genreform/@type | function/@type">
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


    <!-- address now only in repository and publicationstmt -->

    <!-- ############################################### -->
    <!-- ADDRESS                                     -->
    <!-- ############################################### -->
    <!--
    <xsl:template match="address[not(parent::repository) and not(parent::publicationtmt)]">
        <xsl:choose>
            <xsl:when
                test="not(parent::entry) 
                and not(parent::p) 
                and not(parent::event) 
                and not(parent::item)
                and not(parent::extref)
                and not(parent::extrefloc)
                and not(parent::ref)
                and not(parent::refloc)
                and not (parent::descgrp)">
                <xsl:element name="p">
                    <xsl:for-each select="addressline">
                        <xsl:apply-templates/>
                        <xsl:if test="position()!=last()">
                            <xsl:element name="lb"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="addressline">
                    <xsl:apply-templates/> -->
    <!-- MR: Not sure if we want to add commas here.  -->
    <!--<xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>-->
    <!--               </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
-->

    <!-- move element to sibling or skip? -->
    <!-- ############################################### -->
    <!-- ACCESSRESTRICT + LEGALSTATUS                    -->
    <!-- ############################################### -->

    <xsl:template match="accessrestrict">
        <xsl:element name="{local-name()}" namespace="{$eadxmlns}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
        <xsl:for-each select="legalstatus">
            <xsl:element name="{local-name()}" namespace="{$eadxmlns}">
                <xsl:element name="p" namespace="{$eadxmlns}">
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="accessrestrict/legalstatus"/>

    <!-- ############################################### -->
    <!-- CUSTODHIST + ACQINFO                            -->
    <!-- ############################################### -->

    <xsl:template match="custodhist">
        <xsl:element name="{local-name()}" namespace="{$eadxmlns}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
        <xsl:for-each select="acqinfo">
            <xsl:element name="{local-name()}" namespace="{$eadxmlns}">
                <xsl:apply-templates select="@*|node()"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="custodhist/acqinfo"/>


    <!-- process link attributes -->
    <!-- ############################################### -->
    <!-- LINK ELEMENTS and ATTRS                         -->
    <!-- ############################################### -->



    <xsl:template match="extref">
        <ref>
            <xsl:apply-templates select="@*"/>
            <xsl:value-of select="."/>
        </ref>
    </xsl:template>

    <xsl:template match="extptr">
        <ptr>
            <xsl:value-of select="."/>
        </ptr>
    </xsl:template>

    <xsl:template match="@*[name() = 'xlink:type']"> </xsl:template>

    <xsl:template match="@*[starts-with(name(), 'xlink')][name() != 'xlink:type']">
        <xsl:attribute name="{substring-after(name(), ':')}">
            <xsl:value-of select="lower-case(.)"/>
        </xsl:attribute>
    </xsl:template>

    <!-- ############################################### -->
    <!-- OTHER TEMPLATES                                 -->
    <!-- ############################################### -->

    <xsl:template name="removedElement">
        <xsl:text>DEPRECATED ELEMENT OR ATTRIBUTE </xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>&#160;</xsl:text>
        <xsl:text>REMOVED FROM </xsl:text>
        <xsl:value-of select="parent::*/local-name()"/>
    </xsl:template>

    <xsl:template name="commentAndMessage">
        <xsl:param name="comment"/>
        <xsl:if test="$addMigrationComments">
            <xsl:comment><xsl:value-of select="$comment"/></xsl:comment>
        </xsl:if>
        <xsl:if test="$addMigrationMessages">
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

    <xsl:template name="dscOrphanElements">
        <xsl:text>DSC CHILD ELEMENT </xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>&#160;</xsl:text>
        <xsl:text>ORPHANED BY DEPRECATION OF DSC. MIGRATION PATH PENDING</xsl:text>
    </xsl:template>

    <xsl:template name="blockquoteOrphanElements">
        <xsl:text>INLINE BLOCKQUOTE CHILD ELEMENT </xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>&#160;</xsl:text>
        <xsl:text>ORPHANED BY CONVERSION OF INLINE BLOCKQUOTE TO QUOTE. MIGRATION PATH PENDING</xsl:text>
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
