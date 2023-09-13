<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:mf="urn:x-xspectacles:functions"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="3.0">

    <!--
        Sample Code for "Testing Boolean-Valued Functions"
        https://medium.com/@xspectacles/testing-boolean-valued-functions-xspec-blooper-4c27b2055f0b
    -->

    <xsl:function name="mf:is-pos" as="xs:boolean">
        <xsl:param name="int" as="xs:integer"/>
        <xsl:sequence select="$int gt 0"/>
    </xsl:function>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->