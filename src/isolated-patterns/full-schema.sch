<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
  queryBinding="xslt2">

  <!--
    Sample Code for "Testing Schematron Patterns in Isolation"
    https://medium.com/@xspectacles/testing-schematron-patterns-in-isolation-06ee5e28a71f
  -->

  <sch:include href="pattern1.sch"/>
  <sch:include href="pattern2.sch"/>

  <!-- Series of phase definitions to make patterns testable
    in isolation -->
  <sch:phase id="id-of-pattern1-phase">
    <sch:active pattern="id-of-pattern1"/>
  </sch:phase>
  <sch:phase id="id-of-pattern2-phase">
    <sch:active pattern="id-of-pattern2"/>
  </sch:phase>

</sch:schema>

<!-- Copyright © 2023 by Amanda Galtman. -->