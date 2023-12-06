<?xml version="1.0" encoding="UTF-8"?>
<sch:pattern xmlns:sch="http://purl.oclc.org/dsdl/schematron"
  id="id-of-pattern2">

  <!--
    Sample Code for "Testing Schematron Patterns in Isolation"
    https://medium.com/@xspectacles/testing-schematron-patterns-in-isolation-06ee5e28a71f
  -->

  <sch:rule context="section">
    <sch:assert
      test="descendant::abstract"
      id="section-abstract"
      >Section must contain abstract.</sch:assert>
  </sch:rule>

  <!-- In a large schema, this file could have many rules,
    each with many sch:assert or sch:report elements. -->

</sch:pattern>

<!-- Copyright © 2023 by Amanda Galtman. -->