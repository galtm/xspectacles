<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:f="urn:x-xspectacles:functions:decimal-comparison"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="#all"
  version="3.0">

  <!--
    Sample code for "Decimal Number Comparison in XSpec"
    https://medium.com/@xspectacles/decimal-number-comparison-in-xspec-86f3246f542b
  -->
  
  <xsl:function name="f:slope" as="xs:decimal">
    <xsl:param name="P" as="xs:decimal+"/>
    <xsl:param name="Q" as="xs:decimal+"/>
    <xsl:sequence select="($P[2] - $Q[2]) div ($P[1] - $Q[1])"/>
  </xsl:function>

</xsl:stylesheet>

<!-- Copyright © 2025 by Amanda Galtman. -->