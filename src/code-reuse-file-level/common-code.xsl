<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:db="http://docbook.org/ns/docbook"
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://docbook.org/ns/docbook"
    version="3.0">

    <!--
        Sample code for "Code Reuse at the File Level in XSpec"
        https://medium.com/@xspectacles/code-reuse-at-the-file-level-in-xspec-78e5f631f8f9
    -->
    <xsl:template match="topic" as="element(h:html)">
        <xsl:param name="head-prefix" select="'Topic: '" as="xs:string"/>
        <xsl:variable name="title">
            <xsl:apply-templates select="(title | info/title)[1]"/>
        </xsl:variable>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>
                    <xsl:sequence select="concat($head-prefix, $title)"/>
                </title>
                <!-- meta-description template is in distinct-code1.xsl or distinct-code2.xsl -->
                <xsl:call-template name="meta-description">
                    <xsl:with-param name="title" select="$title"/>
                </xsl:call-template>
            </head>
            <body>
                <h1>
                    <xsl:sequence select="$title"/>
                </h1>
                <xsl:apply-templates select="*[not(self::title or self::info)]"/>
                <xsl:call-template name="legal-footer"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="legal-footer">
        <div class="legal-footer" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="." mode="legal-footer"/>
        </div>
    </xsl:template>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->
