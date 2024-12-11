<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--
    Sample Code for "Overriding Global XSLT Variables in XSpec, Part 2"
    https://medium.com/@xspectacles/overriding-global-xslt-variables-in-xspec-part-2-31829081f982
  -->

  <xsl:param name="my-param" as="xs:string" select="'from production'"/>
  <xsl:variable name="data-file-name" as="xs:string" select="'production.xml'"/>

  <xsl:template name="show-values-of-globals" as="xs:string+">
    <xsl:sequence select="($my-param, $data-file-name)"/>
  </xsl:template>

</xsl:stylesheet>
<!-- Copyright © 2024 by Amanda Galtman. -->