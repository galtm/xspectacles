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

    <xsl:template match="ul" mode="multiple-text-nodes">
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="ul" mode="one-text-node">
        <xsl:value-of>
            <xsl:text>&#10;</xsl:text>
            <xsl:apply-templates/>
        </xsl:value-of>
    </xsl:template>
    
    <xsl:template match="ul" mode="one-document-node">
        <xsl:document>
            <xsl:text>&#10;</xsl:text>
            <xsl:apply-templates/>
        </xsl:document>
    </xsl:template>

    <xsl:template match="li">
        <xsl:text>&#10;* </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->