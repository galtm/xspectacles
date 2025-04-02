<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:f="urn:x-xspectacles:functions:pointing-by-catalog"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="#all"
  version="3.0">
    
  <!--
    Sample code for "Portable and Importable File References in XSpec"
    https://medium.com/@xspectacles/portable-and-importable-file-references-in-xspec-c2aa0adc50fc
  -->

  <xsl:function name="f:output-some-xml" as="element(created)">
    <created>2025-03-21</created>
  </xsl:function>

  <xsl:function name="f:output-some-text" as="text()">
    <xsl:text>Created 2025-03-21</xsl:text>
  </xsl:function>

  <xsl:function name="f:output-some-json" as="map(*)">
    <xsl:map-entry key="'created'" select="'2025-03-21'"/>
  </xsl:function>
</xsl:stylesheet>

<!-- Copyright © 2025 by Amanda Galtman. -->