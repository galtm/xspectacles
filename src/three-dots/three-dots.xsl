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

    <xsl:template name="product-row" as="element(h:tr)">
        <xsl:param name="products" as="element(db:productname)+"
            required="yes"/>
        <h:tr>
            <h:td>
                <h:strong class="plabel">Products</h:strong>
            </h:td>
            <h:td>
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
            </h:td>
        </h:tr>
    </xsl:template>

    <xsl:template match="db:productname" as="element(h:span)">
        <h:span class="pname">
            <xsl:apply-templates select="."
                mode="with-trademark-symbols"/>
        </h:span>
    </xsl:template>

    <!--
        A real system would have code to handle db:productname
        elements that contain trademark markup. Here, we omit
        it and rely on on-no-match="text-only-copy" instead,
        because trademark handling is not relevant for the example.
    -->
    <xsl:mode name="with-trademark-symbols"
        on-no-match="text-only-copy"/>

</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->