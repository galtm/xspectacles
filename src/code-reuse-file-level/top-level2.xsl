<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    exclude-result-prefixes="#all"
    version="3.0">

    <!--
        Sample code for "Code Reuse at the File Level in XSpec"
        https://medium.com/@xspectacles/code-reuse-at-the-file-level-in-xspec-78e5f631f8f9
    -->

    <xsl:param name="some-global-option" select="'b'"/>

    <xsl:import href="common-code.xsl"/>
    <xsl:include href="distinct-code2.xsl"/>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->
