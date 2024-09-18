<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="3.0"
  xmlns:rpt="urn:x-xspectacles:functions:report"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--
    Sample Code for "Ignoring Code Comments During XSpec Testing"
    https://medium.com/@xspectacles/ignoring-code-comments-during-xspec-testing-a460f35a25bb
  -->

  <xsl:function name="rpt:report" as="element(report)"
    visibility="public">
    <xsl:param name="input" as="node()"/>
    <xsl:variable name="boilerplate-comment" as="comment()">
      <xsl:comment>Report about data</xsl:comment>
    </xsl:variable>
    <report xsl:expand-text="yes">
      <xsl:sequence select="
          (
          $input/descendant::comment(),
          $boilerplate-comment
          )[1]"/>
      <report-item>Sum: {sum($input//data/number())}</report-item>
      <report-item>Mean: {avg($input//data/number())}</report-item>
    </report>
  </xsl:function>
</xsl:stylesheet>
<!-- Copyright © 2024 by Amanda Galtman. -->