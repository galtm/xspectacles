<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:mf="urn:x-xspectacles:functions"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="#all"
  version="3.0">

  <!--
    Sample Code for "The Equality Check that's Neither True Nor False"
    https://medium.com/@xspectacles/the-equality-check-thats-neither-true-nor-false-c32a8d0de760
  -->

  <xsl:function name="mf:stub" as="element(some-result-element)">
    <some-result-element/>
  </xsl:function>

  <xsl:function name="mf:stub" as="element(some-result-element)">
    <xsl:param name="idvalue" as="xs:string"/>
    <some-result-element id="{$idvalue}"/>
  </xsl:function>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->