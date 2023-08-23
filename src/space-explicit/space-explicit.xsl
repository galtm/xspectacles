<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

    <!--
        Sample code for "Testing Explicit Whitespace in XSpec"
        https://medium.com/@xspectacles/testing-explicit-whitespace-in-xspec-3da21af64ab6
    -->

    <xsl:template match="/">
        <out>
            <xsl:text>&#10;</xsl:text>
            <element/>
            <xsl:apply-templates/>
            <xsl:text>&#10;</xsl:text>
        </out>
    </xsl:template>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->