<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:db="http://docbook.org/ns/docbook"
  xmlns:h="http://www.w3.org/1999/xhtml"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="#all"
  version="3.0">

  <!--
    Sample code for "Testing a Thin-Wrapper XSLT Template Without Excessive Repetition"
    https://medium.com/@xspectacles/testing-a-thin-wrapper-xslt-template-without-excessive-repetition-e41d70ecaf19
  -->

  <!-- Thin wrapper around link-element template -->
  <xsl:template match="db:emphasis[@xlink:href != '']"
    as="element(h:em)">
    <h:em>
      <xsl:call-template name="link-element"/>
    </h:em>
  </xsl:template>

  <!-- In reality, link resolution is complicated.
    For this example, simply output a sample link. -->
  <xsl:template name="link-element" as="element(h:a)">
    <h:a href="some-path/{@xlink:href}#some-anchor">some text</h:a>
  </xsl:template>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->