<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:mf="urn:x-xspectacles:functions:out-of-scope"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="#all"
  version="3.0">

  <!--
    Sample code for "Content Outside the Selection in XSpec"
    https://medium.com/@xspectacles/content-outside-the-selection-in-xspec-058643f390d5
  -->

  <xsl:function name="mf:parent" as="node()?">
    <xsl:param name="node" as="node()"/>
    <xsl:sequence select="$node/parent::node()"/>
  </xsl:function>

  <xsl:function name="mf:following-sibling" as="node()*">
    <xsl:param name="node" as="node()"/>
    <xsl:sequence select="$node/following-sibling::node()"/>
  </xsl:function>

  <xsl:template match="parent/child">
    <found-child-within-parent/>
    <xsl:apply-templates
      select="following-sibling::*"/>
  </xsl:template>

  <xsl:template match="sibling">
    <found-sibling/>
  </xsl:template>

  <xsl:template match="*">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>

<!-- Copyright © 2024 by Amanda Galtman. -->