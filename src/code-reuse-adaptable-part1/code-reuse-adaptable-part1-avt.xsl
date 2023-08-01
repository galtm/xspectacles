<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:db="http://docbook.org/ns/docbook"
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://docbook.org/ns/docbook"
    version="3.0">

    <!--
        Sample code for "Adaptable Code Reuse in XSpec, Part 1: Value Templates"
        https://medium.com/@xspectacles/adaptable-code-reuse-in-xspec-part-1-3cf896d61bbb
    -->

    <!-- Variation Using Attribute Value Templates -->
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
                    <xsl:attribute name="class">
                        <xsl:choose>
                            <xsl:when test="@xml:id='special'">special-h1</xsl:when>
                            <xsl:otherwise>standard-h1</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:sequence select="$title"/>
                </h1>
                <xsl:apply-templates select="*[not(self::title or self::info)]"/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->
