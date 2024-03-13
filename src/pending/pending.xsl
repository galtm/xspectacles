<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:mf="urn:x-xspectacles:functions:pending"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="#all"
  version="3.0">

  <!--
    Sample code for 'Saying "Not Yet" in XSpec'
    https://medium.com/@xspectacles/saying-not-yet-in-xspec-759dff9ed50d
  -->

  <xsl:function name="mf:myfunc" as="node()">
    <xsl:param name="arg" as="node()"/>
    <xsl:sequence select="$arg"/>
  </xsl:function>

</xsl:stylesheet>

<!-- Copyright © 2024 by Amanda Galtman. -->