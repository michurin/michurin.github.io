<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text"/>
<xsl:template match="/">
  <xsl:text>*** Links:
</xsl:text>
  <xsl:for-each select="//a">
    <xsl:value-of select="./@target"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="./@href"/>
    <xsl:text> "</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>"
</xsl:text>
  </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
