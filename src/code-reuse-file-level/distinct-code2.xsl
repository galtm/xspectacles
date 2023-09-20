<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    exclude-result-prefixes="#all"
    version="3.0">

    <!--
        Sample code for "Code Reuse at the File Level in XSpec"
        https://medium.com/@xspectacles/code-reuse-at-the-file-level-in-xspec-78e5f631f8f9
    -->

    <xsl:template name="meta-description">
        <xsl:param name="title"/>
        <meta xmlns="http://www.w3.org/1999/xhtml"
            name="description"
            content="{concat($title,' | XYZ Company')}"/>
    </xsl:template>

    <xsl:template match="*" mode="legal-footer">
        <p xmlns="http://www.w3.org/1999/xhtml">
            This information is for educational purposes only.
            Do not rely on it in an emergency.
        </p>
    </xsl:template>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->