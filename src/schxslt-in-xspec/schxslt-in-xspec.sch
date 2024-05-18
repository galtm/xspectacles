<?xml version="1.0" encoding="UTF-8"?>
<sch:schema queryBinding="xslt2"
  xmlns:sch="http://purl.oclc.org/dsdl/schematron">

  <!--
    Sample code for "Text Nodes and Locations in XSpec Tests for Schematron"
    https://medium.com/@xspectacles/text-nodes-and-locations-in-xspec-tests-for-schematron-2174e7c943b3
  -->

  <sch:pattern>
    <sch:rule context="para/node()[1]/self::text()">
      <sch:assert test="not(starts-with(., ' '))" id="sp"
        >Paragraph must start with a word, not a space.</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>

<!-- Copyright © 2024 by Amanda Galtman. -->