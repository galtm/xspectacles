<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:mf="urn:x-xspectacles:functions:one-or-more"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="#all"
  version="3.0">

  <!--
    Sample Code for "One-or-More Ways to Foil Empty-Sequence Surprises in XSpec"
    https://medium.com/@xspectacles/one-or-more-ways-to-foil-empty-sequence-surprises-in-xspec-882e0af459ea
  -->

  <!-- To create deliberate XSpec test problems, <x:expect>
    uses ul-style instead of style-ul. -->
  <xsl:function name="mf:create-list" as="element()">
    <div class="container">
      <div class="style-ul">
        <ul>
          <li>div contains list</li>
          <li>but no p elements</li>
        </ul>
      </div>
    </div>
  </xsl:function>

  <!-- To create deliberate XSpec test failures, <x:param>
    uses an empty sequence instead of a node. -->
  <xsl:function name="mf:punct-only-content" as="xs:string">
    <xsl:param name="n" as="node()?"/>
    <xsl:sequence select="replace($n/string(),'\P{P}','')"/>
  </xsl:function>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->