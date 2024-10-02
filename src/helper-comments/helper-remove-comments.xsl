<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="3.0"
  xmlns:frc="urn:x-xspectacles:functions:helper:remove-comments"
  xmlns:mrc="urn:x-xspectacles:modes:helper:remove-comments"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--
    Sample Code for "Ignoring Code Comments During XSpec Testing"
    https://medium.com/@xspectacles/ignoring-code-comments-during-xspec-testing-a460f35a25bb
  -->

  <!--
    Remove certain comments from $node, assumed to be an element,
    document node, or empty sequence. The comments to remove are those
    whose space-normalized content starts with 'TEST NOTE:'.
  -->
  <xsl:function name="frc:remove-comments" as="node()?"
    visibility="public">
    <xsl:param name="element-or-document-node" as="node()?"/>
    <xsl:apply-templates select="$element-or-document-node"
      mode="mrc:remove-comments"/>
  </xsl:function>

  <xsl:mode name="mrc:remove-comments" on-multiple-match="fail"
    on-no-match="fail"/>

  <!-- Low-priority identity template -->
  <xsl:template match="document-node() | node() | @*" mode="mrc:remove-comments"
    priority="-10" as="node()">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*" mode="#current"/>
    </xsl:copy>
  </xsl:template>

  <!-- Discard comment nodes that start with specified prefix. -->
  <xsl:variable name="frc:prefix" as="xs:string" select="'TEST NOTE:'"/>
  <xsl:template match="comment()[starts-with(normalize-space(.), $frc:prefix)]"
    mode="mrc:remove-comments" as="empty-sequence()"/>

</xsl:stylesheet>
<!-- Copyright © 2024 by Amanda Galtman. -->