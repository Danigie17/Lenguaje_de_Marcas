<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
            </head>
            <body>
                <!--<h2><xsl:value-of select="reservas/reserva[@estado='confirmada']/cliente/nombre"/></h2>
                <p>Teléfono: <b><xsl:value-of select="reservas/reserva[@estado='confirmada']/cliente/telefono"/></b></p>
                <p>Email: <xsl:value-of select="reservas/reserva[@estado='confirmada']/cliente/email"/></p>
                <h3>Fecha/Hora: <xsl:value-of select="reservas/reserva[@estado='confirmada']/servicio/fecha"/>/<xsl:value-of select="reservas/reserva[@estado='confirmada']/servicio/hora"/></h3>
                <p>Nº Personas: <xsl:value-of select="reservas/reserva[@estado='confirmada']/servicio/personas"/></p>
            -->
                <table style="border:solid 1px red;">
                    <tr>
                        <th>Título</th>
                        <th>Precio</th>
                    </tr>
                    <tr>
                        <td>
                        <xsl:for-each select="//libro/titulo">
                            <tr>
                                <td>
                                <p><xsl:value-of select="."/></p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <p><xsl:value-of select="../precio"/></p>
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
