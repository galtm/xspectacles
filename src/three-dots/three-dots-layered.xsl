<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:db="http://docbook.org/ns/docbook"
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

    <!--
        Sample code for 'Saying "Whatever" in XSpec: How, Why, When'
        https://medium.com/@xspectacles/saying-whatever-in-xspec-how-why-when-979ef97294e
    -->

    <!-- Layering Tests for Dependent Code Units -->

    <xsl:template name="product-row" as="element(h:tr)">
        <xsl:param name="products" as="element(db:productname)+"
            required="yes"/>
        <h:tr>
            <h:td>
                <h:strong class="plabel">Products</h:strong>
            </h:td>
            <h:td>
                <xsl:call-template name="product-name-or-list">
                    <xsl:with-param name="products" select="$products"/>
                </xsl:call-template>
            </h:td>
        </h:tr>
    </xsl:template>

    <xsl:template name="product-name-or-list" as="element()">
        <xsl:param name="products" as="element(db:productname)+"
            required="yes"/>
        <xsl:choose>
            <xsl:when test="count($products) eq 1">
                <xsl:apply-templates
                    select="$products"/>
            </xsl:when>
            <xsl:otherwise>
                <h:ul>
                    <xsl:for-each select="$products">
                        <h:li>
                            <xsl:apply-templates
                                select="."/>
                        </h:li>
                    </xsl:for-each>
                </h:ul>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="db:productname" as="element(h:span)">
        <h:span class="pname">
            <xsl:apply-templates select="."
                mode="with-trademark-symbols"/>
        </h:span>
    </xsl:template>

    <xsl:template match="db:trademark[@class='registered']"
        mode="with-trademark-symbols">
        <xsl:apply-templates/><h:span>®</h:span>
    </xsl:template>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->