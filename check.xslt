<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text"/>
<xsl:template match="/">
  <xsl:text>*** Links:&#10;</xsl:text>
  <xsl:for-each select="//a">
    <xsl:value-of select="./@target"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="./@href"/>
    <xsl:text>&#9;&quot;</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>&quot;&#10;</xsl:text>
  </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
