<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

  <!--
    Sample code for "Testing Schematron Messages with XSpec 3.0"
    https://medium.com/@xspectacles/testing-schematron-messages-with-xspec-3-0-1adc9be69a4d
  -->

  <!-- "Defining Diagnostic Messages" -->

  <sch:pattern>
    <sch:rule context="section/section/info">
      <sch:let name="top-section-title"
        value="ancestor::section[last()]/title"/>
      <sch:assert test="false()" id="subsection-no-info"
        diagnostics="guideline-1-2">
        Subsection must not contain info. Move children to
        "<sch:value-of select="$top-section-title"/>" info.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:diagnostics>
    <sch:diagnostic id="guideline-1-2">[WG 1.2]</sch:diagnostic>
    <sch:diagnostic id="guideline-1-3">[WG 1.3]</sch:diagnostic>
    <!-- More diagnostic definitions can go here -->
  </sch:diagnostics>
</sch:schema>

<!-- Copyright © 2024 by Amanda Galtman. -->