<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:f="urn:x-xspectacles:functions:catch-error"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="#all"
  version="3.0">

  <!--
    Sample Code for "How to Test Error Handling in XSpec"
    https://medium.com/@xspectacles/how-to-test-error-handling-in-xspec-cdd83f498204
  -->

  <xsl:function name="f:one-over" as="xs:numeric">
    <xsl:param name="n" as="xs:numeric"/>
    <xsl:choose>
      <xsl:when test="$n eq 0">
        <xsl:message terminate="yes"
          expand-text="yes">one-over() does not support n={$n}</xsl:message>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="1 div $n"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!-- Mode that triggers on-no-match="fail" error if
    XSpec context includes an element with no matching
    template in this mode -->
  <xsl:mode name="my-mode" on-no-match="fail"/>
  <xsl:template match="foo" mode="my-mode">
    <xsl:sequence select="."/>
  </xsl:template>
</xsl:stylesheet>

<!-- Copyright © 2024 by Amanda Galtman. -->