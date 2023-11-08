<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process">

  <!--
    Sample Code for "One-or-More Ways to Foil Empty-Sequence Surprises in XSpec"
    https://medium.com/@xspectacles/one-or-more-ways-to-foil-empty-sequence-surprises-in-xspec-882e0af459ea
  -->

  <sch:pattern>
    <sch:rule context="section">
      <sch:assert test="title">Section must have a title</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>

<!-- Copyright © 2023 by Amanda Galtman. -->