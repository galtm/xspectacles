<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
  queryBinding="xslt2">

  <!--
    Sample Code for "Testing Schematron Patterns in Isolation"
    https://medium.com/@xspectacles/testing-schematron-patterns-in-isolation-06ee5e28a71f
  -->

  <!-- Abstract pattern designed to report the instantiation's
    parameter value -->
  <sch:pattern id="empty-element" abstract="true">
    <sch:rule context="*">
      <sch:report test="$p eq 'pattern1'"
        id="found-pattern1">In instance 1</sch:report>
      <sch:report test="$p eq 'pattern2'"
        id="found-pattern2">In instance 2</sch:report>
    </sch:rule>
  </sch:pattern>

  <!-- Series of instantiations of abstract pattern -->
  <sch:pattern is-a="empty-element" id="id-of-pattern1">
    <sch:param name="p" value="'pattern1'"/>
  </sch:pattern>
  <sch:pattern is-a="empty-element" id="id-of-pattern2">
    <sch:param name="p" value="'pattern2'"/>
  </sch:pattern>

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