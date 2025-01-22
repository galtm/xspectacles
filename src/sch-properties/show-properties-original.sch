<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  queryBinding="xslt2">

  <!--
    Sample code for "Troubleshooting Schematron? XSpec Can Help."
    https://medium.com/@xspectacles/troubleshooting-schematron-xspec-can-help-d389fd51aa9f
  -->

  <sch:pattern>
    <sch:rule context="//link[@href]">
      <!-- NOTE: This rule has a bug!
        The topic describes how to find the bug. -->

      <!-- Schematron variables for intermediate values -->
      <sch:let name="parts" value="tokenize(@href, '#')"/>
      <sch:let name="topic-source-uri"
        value="resolve-uri($parts[1], base-uri(.))"/>
      <sch:let name="doc" value="
          if (doc-available($topic-source-uri))
          then
            doc($topic-source-uri)
          else
            ()"/>
      
      <!-- Verification -->
      <sch:assert id="check-href"
        test="$parts[2] = $doc/descendant::*/@id/string()"
        role="error"
        >Anchor must be among id values in topic source</sch:assert>
    </sch:rule>
  </sch:pattern>

</sch:schema>

<!-- Copyright © 2025 by Amanda Galtman. -->