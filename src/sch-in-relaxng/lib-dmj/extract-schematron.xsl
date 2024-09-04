<?xml version="1.0" encoding="UTF-8"?>

<!--
  This file's content was copied from Revision 1 of
  https://gist.github.com/dmj/8e099668fea614c7e2ad843aa97326a6 
  on 4 Sep 2024.
-->

<xsl:transform version="3.0" expand-text="yes"
  xmlns:sch="http://purl.oclc.org/dsdl/schematron"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:mode on-no-match="shallow-skip" use-accumulators="namespaces"/>
  
  <xsl:param name="queryBinding" as="xs:string">xslt3</xsl:param>
  
  <xsl:accumulator name="namespaces" as="element(sch:ns)*" initial-value="()">
    <xsl:accumulator-rule match="sch:*">
      <xsl:variable name="context" as="element()" select="."/>
      <xsl:sequence>
        <xsl:sequence select="$value"/>
        <xsl:for-each select="in-scope-prefixes($context)[not(. = $value/@prefix)][. ne '']">
          <sch:ns prefix="{.}" uri="{namespace-uri-for-prefix(., $context)}"/>
        </xsl:for-each>
      </xsl:sequence>
    </xsl:accumulator-rule>
  </xsl:accumulator>
  
  <xsl:template match="root()" as="element(sch:schema)">
    <xsl:variable name="patterns" as="element()*">
      <xsl:apply-templates/>
    </xsl:variable>
    <xsl:variable name="namespaces" as="element(sch:ns)*">
      <xsl:sequence select="accumulator-after('namespaces')"/>
    </xsl:variable>
    
    <sch:schema queryBinding="{$queryBinding}">
      <xsl:sequence select="$namespaces"/>
      <xsl:sequence select="$patterns"/>
    </sch:schema>
  </xsl:template>
  
  <xsl:template match="sch:let" as="element(sch:let)">
    <xsl:sequence select="."/>
  </xsl:template>
  
  <xsl:template match="sch:pattern" as="element(sch:pattern)">
    <xsl:copy>
      <xsl:sequence select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="sch:rule[empty(ancestor::sch:pattern)]" as="element(sch:pattern)" priority="10">
    <sch:pattern>
      <xsl:next-match/>
    </sch:pattern>
  </xsl:template>
  
  <xsl:template match="sch:rule" as="element(sch:rule)">
    <xsl:copy>
      <xsl:sequence select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="sch:assert | sch:report" as="element()">
    <xsl:choose>
      <xsl:when test="empty(ancestor::sch:rule)">
        <xsl:message terminate="yes">
          <xsl:text>ERROR: {name()} without context</xsl:text>
        </xsl:message>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="."/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:transform>
  
