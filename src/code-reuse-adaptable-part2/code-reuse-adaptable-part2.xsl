<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:mf="urn:x-xspectacles:functions"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://docbook.org/ns/docbook"
    version="3.0">

    <!--
        Sample code for "Adaptable Code Reuse in XSpec, Part 2: XPath Matching"
        https://medium.com/@xspectacles/adaptable-code-reuse-in-xspec-part-2-8820b1cd255d
    -->

    <!-- Example Checking a Map -->
    <xsl:function name="mf:options" as="map(*)">
        <xsl:param name="ignore-dup" as="xs:boolean"/>
        <xsl:map>
            <xsl:map-entry
                key="'duplicates'"
                select="
                    if ($ignore-dup)
                    then 'use-last'
                    else 'reject'
                "/>
            <xsl:map-entry key="'escape'" select="false()"/>
        </xsl:map>
    </xsl:function>

    <!-- Example Matching XML Subtree -->
    <xsl:function name="mf:json-processing" as="element(fn:map)">
        <xsl:param name="json-string" as="xs:string"/>
        <map xmlns="http://www.w3.org/2005/xpath-functions">
            <!-- revision property -->
            <string key="revision">1.0</string>
            <!-- properties from $json-string -->
            <xsl:sequence select="json-to-xml($json-string)/fn:map/*"/>
        </map>
    </xsl:function>
</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->