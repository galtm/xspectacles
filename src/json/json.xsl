<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
xmlns:mf="urn:x-xspectacles:functions:json"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="#all"
version="3.0">

  <!--
    Sample code for "6 Tips for Embedding JSON in XSpec Tests"
    https://medium.com/@xspectacles/6-tips-for-embedding-json-in-xspec-tests-97306ae5578f
  -->
    
  <xsl:function name="mf:json-output" as="xs:string">
    <xsl:sequence expand-text="1">{'{"a": ["b","c"],"d": {"e": 1,"f": true}}'}</xsl:sequence>
  </xsl:function>

  <xsl:function name="mf:json-in-element" as="element(script)">
    <script>
      <xsl:value-of select="mf:json-output()"/>
    </script>
  </xsl:function>

  <!-- Return 'a' property of input JSON string -->
  <xsl:function name="mf:json-input">
    <xsl:param name="json" as="xs:string"/>
    <xsl:sequence select="(parse-json($json))?a"/>
  </xsl:function>
</xsl:stylesheet>

<!-- Copyright © 2024 by Amanda Galtman. -->