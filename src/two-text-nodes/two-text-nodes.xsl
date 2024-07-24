<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:f="urn:x-xspectacles:functions:two-text-nodes"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="#all"
  version="3.0">

  <!--
    Sample Code for "A Tale of Two Text Nodes, Plus Balisage 2024"
    https://medium.com/@xspectacles/a-tale-of-two-text-nodes-plus-balisage-2024-a4d03b8e4a26
  -->

  <xsl:function name="f:two-text-nodes" as="text()+">
    <xsl:value-of>abc</xsl:value-of>
    <xsl:value-of>def</xsl:value-of>
  </xsl:function>

  <xsl:function name="f:two-text-nodes-equivalent" as="text()+">
    <xsl:value-of>
      <xsl:value-of>a</xsl:value-of>
      <xsl:value-of>b</xsl:value-of>
      <xsl:value-of>c</xsl:value-of>
    </xsl:value-of>
    <xsl:value-of>def</xsl:value-of>
  </xsl:function>
</xsl:stylesheet>

<!-- Copyright © 2024 by Amanda Galtman. -->