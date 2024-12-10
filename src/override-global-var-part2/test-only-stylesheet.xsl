<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="#all" version="2.0">

  <!--
    Sample Code for "Overriding Global XSLT Variables in XSpec, Part 2"
    https://medium.com/@xspectacles/overriding-global-xslt-variables-in-xspec-part-2-31829081f982
  -->

  <xsl:import href="production-stylesheet.xsl"/>
  <xsl:param name="data-file-name" select="'default-test-data.xml'"/>

</xsl:stylesheet>
<!-- Copyright © 2024 by Amanda Galtman. -->
