<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

  <!--
    Sample Code for "My XML Content in XSpec Causes an Error"
    https://medium.com/@xspectacles/my-xml-content-in-xspec-causes-an-error-90028056d6a0
  -->

  <sch:pattern>
    <sch:rule context="elem">
      <sch:report test="exists(@attr)"
        id="attr-value">Value of attr is <sch:value-of select="@attr"/></sch:report>
    </sch:rule>
  </sch:pattern>
</sch:schema>

<!-- Copyright © 2024 by Amanda Galtman. -->
