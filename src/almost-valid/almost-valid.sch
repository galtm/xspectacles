<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--
    Sample code for 'Saying "Almost Valid" or "Beyond Valid" in XSpec Tests for Schematron'
    https://medium.com/@xspectacles/saying-almost-valid-or-beyond-valid-in-xspec-tests-for-schematron-720c2f778680
  -->

  <sch:pattern id="glossary">
    <sch:rule context="//glossdef" id="definition">
      <sch:assert test="child::p"
        role="error"
        id="abc">glossdef must have a child paragraph</sch:assert>
      <sch:report test="count(child::p) gt 4"
        role="warning"
        id="xyz">Can you shorten the definition?</sch:report>
      <sch:assert test="normalize-space(.) != ''"
        role="error"
        id="text">glossdef must have text</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>

<!-- Copyright © 2024 by Amanda Galtman. -->