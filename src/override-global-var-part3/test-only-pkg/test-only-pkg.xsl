<?xml version="1.0" encoding="UTF-8"?>
<xsl:package name="urn:x-xspectacles:pkgs:test-only-pkg"
  package-version="1.0" version="3.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--
    Sample Code for "Overriding Global XSLT Variables in XSpec, Part 3"
    https://medium.com/@xspectacles/overriding-global-xslt-variables-in-xspec-part-3-545205cef963
  -->

  <xsl:use-package name="urn:x-xspectacles:pkgs:production-pkg"
    version="1.0">    
    <xsl:accept component="template" names="show-values-of-globals"
      visibility="public"/>    
    <xsl:override>
      <!-- Override xsl:variable with xsl:param -->
      <xsl:param name="data-file-name" as="xs:string"
        select="'test-data-from-override.xml'"/>
    </xsl:override>
  </xsl:use-package>

</xsl:package>
<!-- Copyright © 2024 by Amanda Galtman. -->
