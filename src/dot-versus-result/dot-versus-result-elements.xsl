<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="3.0">

    <!--
        Sample code for "Ways to Access XSLT Result in XSpec Testing"
        https://medium.com/@xspectacles/ways-to-access-xslt-result-in-xspec-testing-fd3aa22184e0
    -->

    <xsl:template match="ul" mode="multiple-elements"
        as="element()*">
        <xsl:call-template name="links"/>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="ul" mode="one-document-node"
        as="document-node()">
        <xsl:document>
            <xsl:call-template name="links"/>
            <xsl:apply-templates/>
        </xsl:document>
    </xsl:template>

    <xsl:template match="li" as="element(item)">
        <item id="{@xml:id}"/>
    </xsl:template>

    <xsl:template name="links" as="element(links)?">
        <xsl:context-item as="element(ul)"/>
        <xsl:where-populated>
            <links>
                <xsl:for-each select="li">
                    <link href="{concat('#',@xml:id)}">
                        <xsl:value-of select="."/>
                    </link>
                </xsl:for-each>
            </links>            
        </xsl:where-populated>
    </xsl:template>
</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->