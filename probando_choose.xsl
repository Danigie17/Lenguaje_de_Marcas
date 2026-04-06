<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
            </head>
            <body>
                <xsl:for-each select="/libros/libro">
                    <xsl:choose>
                        <xsl:when test="precio&gt;30">
                            <p style="color:red;"><xsl:value-of select="./titulo"/></p>
                        </xsl:when>
                        <xsl:when test="precio&lt;30">
                            <p style="color:blue;"><xsl:value-of select="./titulo"/></p>
                        </xsl:when>
                        <xsl:otherwise>
                            <p style="color:green;"><xsl:value-of select="./titulo"/></p>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>