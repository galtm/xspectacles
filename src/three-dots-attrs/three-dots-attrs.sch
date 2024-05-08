<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--
    Sample code for "Comparing Attributes Selectively in XSpec 3.0"
    https://medium.com/@xspectacles/comparing-attributes-selectively-in-xspec-3-0-f3a457fe8e04
  -->

  <sch:phase id="phase1">
    <sch:active pattern="pattern1"/>
  </sch:phase>

  <sch:pattern id="pattern1">
    <sch:rule context="//glossdef" id="definition">
      <sch:assert test="normalize-space(.) != ''"
        role="error"
        id="text">glossdef must have text</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern id="pattern2">
    <sch:rule context="//something">
      <!-- sch:assert and sch:report would go here -->
    </sch:rule>
  </sch:pattern>

</sch:schema>

<!-- Copyright © 2024 by Amanda Galtman. -->