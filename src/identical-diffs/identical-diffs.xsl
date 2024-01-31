<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:mf="urn:x-xspectacles:functions:identical-diffs"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="#all"
  version="3.0">  

  <!--
    Sample code for "But the Diffs Look the Same"
    https://medium.com/@xspectacles/but-the-diffs-look-the-same-9f03c025c547
  -->

  <xsl:function name="mf:generate-glossentry"
    as="document-node()">
    <xsl:param name="term" as="xs:string"/>
    <xsl:document expand-text="1">
        <glossentry>
          <glossterm>{$term}</glossterm>
          <glossdef>
            <p>Definition of {$term} goes here
                as a paragraph</p>
          </glossdef>
        </glossentry>
    </xsl:document>
  </xsl:function>
</xsl:stylesheet>

<!-- Copyright © 2024 by Amanda Galtman. -->