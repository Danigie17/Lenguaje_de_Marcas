<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Biblioteca</title>
            </head>
            <body>

                <h1>Listado de libros</h1>

                <table border="1">
                    <tr>
                        <th>Título</th>
                        <th>Autor</th>
                        <th>Año</th>
                        <th>Precio</th>
                        <th>Estado</th>
                        <th>Categoría</th>
                    </tr>
                    <tr>
                        <td>
                        <xsl:for-each select="/biblioteca/libro">
                            <tr>
                                <td>
                                    <p><xsl:value-of select="."/></p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p><xsl:value-of select="../autor"/></p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p><xsl:value-of select="../anio"/></p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p><xsl:value-of select="../precio"/><xsl:value-of select="../precio[@moneda]"/></p>
                                    <xsl:if test="precio&gt;30">
                                        <p><xsl:value-of select="../precio"/><xsl:value-of select="../precio[@moneda]"/>(Precio Elevado)</p>
                                    </xsl:if>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="@disponible='si'">
                                            <p>Disponible</p>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <p>No disponible</p>
                                        </xsl:otherwise> 
                                    </xsl:choose>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p><xsl:value-of select="../[@categoria]"/></p>
                                </td>
                            </tr>
                        </xsl:for-each>
                        </td>
                    </tr>
                    

                </table>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>