<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:db="http://docbook.org/ns/docbook"
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://docbook.org/ns/docbook"
    version="3.0">

    <!--
        Sample code for "Code Reuse in XSpec: How to Use x:like"
        https://medium.com/@xspectacles/code-reuse-in-xspec-c51a59d1a709
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
            </head>
            <body>
                <h1>
                    <xsl:sequence select="$title"/>
                </h1>
                <xsl:apply-templates select="*[not(self::title or self::info)]"/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->
