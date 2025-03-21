<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:f="urn:x-xspectacles:functions:pointing-to-files"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="#all"
  version="3.0">
    
  <!--
    Sample code for "Pointing to XML and Other Files in XSpec"
    https://medium.com/@xspectacles/pointing-to-xml-and-other-files-in-xspec-fee4dc6c33f1
  -->

  <!--
    The purpose of this file is to help generate the table of base URIs
    for XSpec elements shown in the topic.

    Code for generating table is at
    https://github.com/galtm/xslt-accumulator-tools

    Command (all on one line):
      java -cp "%SAXON_JAR%" net.sf.saxon.Transform -t
      -s:pointing-to-files-xml-base.xspec
      -xsl:../../../xslt-accumulator-tools/src/acc-reporter.xsl
      -o:showing-base-uri.html
      acc-name=base-uri-of-element acc-decl-uri=showing-base-uri.xsl

    The screen capture in the topic is after touching up the HTML
    file to focus on the point being made in the topic.
  -->

  <xsl:accumulator name="base-uri-of-element" as="xs:string?"
    initial-value="()">

    <xsl:accumulator-rule match="element()"
      select="(base-uri() => replace('^.*src/','')) ! concat('file:/.../', .)"/>

    <xsl:accumulator-rule match="document-node()" phase="end" select="()"/>
    <xsl:accumulator-rule match="text()[normalize-space() eq '']"
      select="'reset for reporting'"/>
  </xsl:accumulator>
</xsl:stylesheet>

<!-- Copyright © 2025 by Amanda Galtman. -->