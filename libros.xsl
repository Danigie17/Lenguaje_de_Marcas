<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <head>
            <meta charset="utf-8"/>
        </head>
            <body>
                <table border="black 1px solid">
                <tr>
                    <th>Título</th>
                    <th>Precio</th>
                    <th>Categoria</th>
                </tr>
                <xsl:for-each select="libreria/libro">
                    <tr>
                    <td><xsl:value-of select="titulo"/></td>
                    <td><xsl:value-of select="precio"/></td>
                    <td><xsl:value-of select="@categoria"/></td>
                    </tr>
                </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>