<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="3.0">

    <!--
        Sample code for "Testing Preformatted or Codelike Text in XSpec"
        https://medium.com/@xspectacles/testing-preformatted-or-codelike-text-in-xspec-ee0fa8e8bee8
    -->

    <xsl:template match="/">
        <md><xsl:apply-templates/></md>
    </xsl:template>

    <xsl:template match="ul">
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="li">
        <xsl:text>&#10;* </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->