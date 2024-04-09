<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

  <!--
    Sample code for "Testing Schematron Messages with XSpec 3.0"
    https://medium.com/@xspectacles/testing-schematron-messages-with-xspec-3-0-1adc9be69a4d
  -->

  <sch:pattern>
    <sch:rule context="section/section/info">
      <sch:let name="top-section-title"
        value="ancestor::section[last()]/title"/>
      <sch:assert test="false()" id="subsection-no-info">
        Subsection must not contain info. Move children to
        "<sch:value-of select="$top-section-title"/>" info.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

</sch:schema>

<!-- Copyright © 2024 by Amanda Galtman. -->