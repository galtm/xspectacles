<?xml version="1.0" encoding="UTF-8"?>
<sch:schema
  xmlns:mf="urn:x-xspectacles:functions:out-of-scope"
  xmlns:sch="http://purl.oclc.org/dsdl/schematron"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  queryBinding="xslt2">

  <!--
    Sample code for "Content Outside the Selection in XSpec"
    https://medium.com/@xspectacles/content-outside-the-selection-in-xspec-058643f390d5
  -->

  <xsl:function name="mf:parent" as="node()?">
    <xsl:param name="node" as="node()"/>
    <xsl:sequence select="$node/parent::node()"/>
  </xsl:function>
  
  <xsl:function name="mf:following-sibling" as="node()*">
    <xsl:param name="node" as="node()"/>
    <xsl:sequence select="$node/following-sibling::node()"/>
  </xsl:function>

  <sch:pattern>
    <sch:rule context="child">
      <sch:report id="found-child"
        test="true()">Found child element</sch:report>
      <sch:report id="found-sibling"
        test="following-sibling::*"
        >Found sibling element</sch:report>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:rule context="parent/child">
      <sch:report id="found-child-within-parent"
        test="true()">Found child element within parent</sch:report>
      <sch:report id="found-sibling-within-parent"
        test="following-sibling::*"
        >Found sibling element from child within parent</sch:report>
    </sch:rule>
  </sch:pattern>

</sch:schema>

<!-- Copyright © 2024 by Amanda Galtman. -->