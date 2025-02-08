<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="#all"
  version="3.0">

  <!--
    Sample code for "How to Write XML Markup in XSpec Labels"
    https://medium.com/@xspectacles/how-to-write-xml-markup-in-xspec-labels-8b24c9829196
  -->

  <xsl:template name="createTable">
    <xsl:context-item as="element(data)"/>
    <xsl:param name="cols" as="xs:integer" select="1"/>
    <table>
      <thead/>
      <tbody>
        <xsl:for-each select="value/node()">
          <tr>
            <td><xsl:sequence select="."/></td>
            <xsl:for-each select="(2 to $cols)">
              <td/>
            </xsl:for-each>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>

</xsl:stylesheet>

<!-- Copyright © 2025 by Amanda Galtman. -->