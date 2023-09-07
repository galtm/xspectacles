<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:mf="urn:x-xspectacles:functions"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="3.0">

    <!--
        Sample code for "Ways to Access XSLT Result in XSpec Testing"
        https://medium.com/@xspectacles/ways-to-access-xslt-result-in-xspec-testing-fd3aa22184e0
    -->

    <xsl:function name="mf:positives" as="xs:integer*">
        <xsl:param name="nums" as="xs:integer+"/>
        <xsl:sequence select="$nums[. gt 0]"/>
    </xsl:function>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->