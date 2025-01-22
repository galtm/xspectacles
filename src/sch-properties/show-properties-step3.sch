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
      <!-- Schematron variables for intermediate values -->
      <sch:let name="parts" value="tokenize(@href, '#')"/>
      <sch:let name="topic-html"
        value="concat('html/', $parts[1])"/>
      <sch:let name="topic-source-uri"
        value="resolve-uri($topic-html, base-uri(.))"/>
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
        properties="topic-source-uri available doc all-ids"
        >Anchor must be among id values in topic source</sch:assert>

      <!-- Temporary -->
      <sch:report id="investigate-check-href"
        test="true()"
        properties="topic-source-uri available doc all-ids"/>
    </sch:rule>
  </sch:pattern>

  <sch:properties>
    <sch:property id="anchor">
      <sch:value-of select="$parts[2]"/>
    </sch:property>
    <sch:property id="all-ids">
      <xsl:copy-of select="$doc/descendant::*/@id/string()"/>
    </sch:property>
    <sch:property id="topic-source-uri">
      <sch:value-of select="$topic-source-uri"/>
    </sch:property>
    <sch:property id="available">
      <xsl:copy-of select="doc-available($topic-source-uri)"/>
    </sch:property>
    <sch:property id="doc">
      <xsl:copy-of select="$doc"/>
    </sch:property>
  </sch:properties>
</sch:schema>

<!-- Copyright © 2025 by Amanda Galtman. -->