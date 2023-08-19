<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

    <!--
        Sample code for "Fixing Surprise Spaces in XSpec Actual Result"
        https://medium.com/@xspectacles/fixing-surprise-spaces-in-xspec-actual-result-3d4463eeb9a1
    -->

    <xsl:template match="productname">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="trademark">
        <xsl:apply-templates/><xsl:text>®</xsl:text>
    </xsl:template>

    <!-- Accumulate the non-space text while traversing each
        product name. Assume productname elements do not nest. -->
    <xsl:accumulator name="non-space" as="xs:string" initial-value="''">
        <xsl:accumulator-rule match="productname" select="''"/>
        <xsl:accumulator-rule match="productname/descendant::text()"
            select="concat($value, replace(.,'\s+',''))"/>
    </xsl:accumulator>

    <!-- For whitespace-only text nodes, check whether the non-space
        text seen so far in this productname element is neither
        empty nor the full product name. In that case, we're in
        the middle of the product name, so the white space is
        significant and we output a single space.
    -->
    <xsl:template match="productname/descendant::text()
        [normalize-space()='']" as="text()?">
        <xsl:variable name="non-space-text-so-far" as="xs:string"
            select="accumulator-before('non-space')"/>
        <!-- Text nodes have no descendants, so we could have used
        either accumulator-before or accumulator-after, above. -->

        <xsl:variable name="full-non-space-text" as="xs:string"
            select="ancestor::productname/accumulator-after('non-space')"/>
        <xsl:if test="($non-space-text-so-far ne '') and
            ($non-space-text-so-far ne $full-non-space-text)">
            <xsl:value-of select="' '"/>
        </xsl:if>
    </xsl:template>

    <!-- This sample top-level template can clarify outside XSpec
        why the text node template above is useful in XSLT, not
        only to make XSpec testing easier. Try running this
        transformation as is, and again while commenting out
        the text node template above. In the latter run, the
        transformation output has extra white space before,
        after, and within the product name. -->
    <xsl:template match="/">
        <xsl:apply-templates
            select="doc('product-catalog.xml')/descendant::productname[@code = 'EIEIO']"
        />
    </xsl:template>
</xsl:stylesheet>

<!-- Copyright © 2023 by Amanda Galtman. -->