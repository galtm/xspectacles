<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

    <!--
        Sample code for "Fixing Surprise Spaces in XSpec Actual Result"
        https://medium.com/@xspectacles/fixing-surprise-spaces-in-xspec-actual-result-3d4463eeb9a1
    -->

    <xsl:template match="productname">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="trademark">
        <xsl:apply-templates/><xsl:text>®</xsl:text>
    </xsl:template>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->