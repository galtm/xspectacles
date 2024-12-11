<?xml version="1.0" encoding="UTF-8"?>
<xsl:package name="urn:x-xspectacles:pkgs:production-pkg"
  package-version="1.0" version="3.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--
    Sample Code for "Overriding Global XSLT Variables in XSpec, Part 3"
    https://medium.com/@xspectacles/overriding-global-xslt-variables-in-xspec-part-3-545205cef963
  -->

  <xsl:param name="my-param" as="xs:string"
    select="'from production'"/>
  <xsl:variable name="data-file-name" as="xs:string"
    select="'production.xml'" visibility="public"/>

  <xsl:template name="show-values-of-globals" visibility="public">
    <xsl:sequence select="($my-param, $data-file-name)"/>
  </xsl:template>

</xsl:package>
<!-- Copyright © 2024 by Amanda Galtman. -->
