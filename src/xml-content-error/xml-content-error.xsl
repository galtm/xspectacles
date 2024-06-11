<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:mf="urn:x-xspectacles:functions:xml-content-error"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="#all"
  version="3.0">

  <!--
    Sample Code for "My XML Content in XSpec Causes an Error"
    https://medium.com/@xspectacles/my-xml-content-in-xspec-causes-an-error-90028056d6a0
  -->

  <xsl:function name="mf:attr-value" as="text()">
    <xsl:param name="elem" as="element()"/>
    <xsl:value-of select="$elem/@attr"/>
  </xsl:function>

</xsl:stylesheet>

<!-- Copyright © 2024 by Amanda Galtman. -->