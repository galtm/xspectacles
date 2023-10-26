<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="#all"
  version="3.0">

  <!--
    Sample code for "Multiple Cases in One XSpec Scenario"
    https://medium.com/@xspectacles/multiple-cases-in-one-xspec-scenario-8adf3d39a1cf
  -->

  <xsl:mode name="graphic-format" on-no-match="fail"/>

  <!-- Matching elements -->
  <xsl:template match="image[@format=('jpeg','png','gif','tiff','bmp','pnm')]"
    mode="graphic-format" as="processing-instruction()">
    <xsl:param name="diagnostics" as="xs:boolean" select="false()"/>
    <xsl:processing-instruction name="process-bitmap-graphic">
      <xsl:if test="$diagnostics">
        <xsl:sequence select="concat(
          'Preceding siblings: ',
          count(preceding-sibling::*),
          ', Ancestors: ',
          count(ancestor::*)
        )"/>
      </xsl:if>
    </xsl:processing-instruction>
  </xsl:template>

  <xsl:template match="image[@format=('svg')]"
    mode="graphic-format" as="processing-instruction()">
    <xsl:processing-instruction name="process-vector-graphic"/>
  </xsl:template>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->
