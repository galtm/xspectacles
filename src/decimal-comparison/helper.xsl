<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:hf="urn:x-xspectacles:functions:helper"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="#all"
  version="3.0">

  <!--
    Sample code for "Decimal Number Comparison in XSpec"
    https://medium.com/@xspectacles/decimal-number-comparison-in-xspec-86f3246f542b
  -->

  <xsl:function name="hf:compare-with-tolerance-text" as="text()">
    <xsl:param name="a" as="xs:numeric"/>
    <xsl:param name="b" as="xs:numeric"/>
    <xsl:param name="tolerance" as="xs:numeric"/>
    <xsl:variable name="abs-diff" select="abs($a - $b)"
      as="xs:numeric"/>
    <xsl:choose>
      <xsl:when test="$abs-diff &lt; $tolerance">
        <xsl:value-of select="'Within tolerance'"/>
      </xsl:when>
      <xsl:otherwise>
        <!-- Information to help investigate failure -->
        <xsl:value-of>
          <xsl:text>Absolute difference: </xsl:text>
          <xsl:sequence select="$abs-diff"/>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Exceeds tolerance by: </xsl:text>
          <xsl:sequence select="$abs-diff - $tolerance"/>
        </xsl:value-of>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="hf:compare-with-tolerance-map" as="map(*)">
    <xsl:param name="a" as="xs:numeric"/>
    <xsl:param name="b" as="xs:numeric"/>
    <xsl:param name="tolerance" as="xs:numeric"/>
    <xsl:variable name="abs-diff" select="abs($a - $b)"
      as="xs:numeric"/>
    <xsl:choose>
      <xsl:when test="$abs-diff &lt; $tolerance">
        <xsl:map-entry key="'result'" select="'Within tolerance'"/>
      </xsl:when>
      <xsl:otherwise>
        <!-- Information to help investigate failure -->
        <xsl:map>
          <xsl:map-entry key="'absolute-difference'"
            select="$abs-diff"/>
          <xsl:map-entry key="'exceeds-tolerance-by'"
            select="$abs-diff - $tolerance"/>          
        </xsl:map>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
</xsl:stylesheet>

<!-- Copyright © 2025 by Amanda Galtman. -->