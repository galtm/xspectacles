<?xml version="1.0" encoding="UTF-8"?>
<sch:schema
  xmlns:sch="http://purl.oclc.org/dsdl/schematron"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  queryBinding="xslt2">

  <!--
    Sample code for 'Saying "Not Yet" in XSpec'
    https://medium.com/@xspectacles/saying-not-yet-in-xspec-759dff9ed50d
  -->

  <sch:pattern>
    <sch:rule context="child">
      <sch:report id="found-element"
        test="true()">Found element</sch:report>
    </sch:rule>
    <sch:rule context="child/*">
      <!-- New feature will go here -->
    </sch:rule>
  </sch:pattern>

</sch:schema>

<!-- Copyright © 2024 by Amanda Galtman. -->