<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">

<html>
<head>
    <title>Factura</title>
    <style>
        body { font-family: Arial; background:#f4f6f9; padding:20px; }
        .box { background:white; padding:20px; border-radius:10px; max-width:900px; margin:auto; }
        h1 { text-align:center; }
        table { width:100%; border-collapse:collapse; }
        th { background:#3498db; color:white; padding:10px; }
        td { padding:8px; border-bottom:1px solid #ddd; }
        .right { text-align:right; margin-top:15px; }
    </style>
</head>

<body>
<div class="box">

<h1>Factura</h1>

<!-- DATOS -->
<p><b>Número: </b>
    <xsl:value-of select="//Invoice/InvoiceHeader/InvoiceNumber"/>
<!-- XSD: InvoiceNumber -->
</p>

<p><b>Fecha: </b>
    <xsl:value-of select="//InvoiceIssueData/IssueDate"/>
<!-- XSD: IssueDate -->
</p>

<!-- EMISOR -->
<h2>Emisor</h2>
<p><xsl:value-of select="//SellerParty/LegalEntity/CorporateName"/>
<!-- XSD: SellerParty/LegalEntity/CorporateName -->
</p>
<p><xsl:value-of select="//SellerParty/TaxIdentification/TaxIdentificationNumber"/>
<!-- XSD: SellerParty/TaxIdentification/TaxIdentificationNumber -->
</p>

<!-- RECEPTOR -->
<h2>Receptor</h2>
<p>
    <xsl:value-of select="//BuyerParty/Individual/Name"/>
    <xsl:value-of select="//BuyerParty/Individual/FirstSurname"/>
    <xsl:value-of select="//BuyerParty/Individual/SecondSurname"/>
<!-- XSD: BuyerParty/Individual/Name -->
<!-- XSD: BuyerParty/Individual/FirstSurname -->
<!-- XSD: BuyerParty/Individual/SecondSurname -->
</p>
<p>
    <xsl:value-of select="//BuyerParty/TaxIdentification/TaxIdentificationNumber"/>
<!-- XSD: BuyerParty/TaxIdentification/TaxIdentificationNumber -->
</p>

<!-- CONCEPTOS -->
<h2>Conceptos</h2>
<table>
<tr>
<th>Descripción</th>
<th>Cantidad</th>
<th>Precio</th>
<th>Total</th>
</tr>

<!-- XSD: InvoiceLine (repetible) -->
<xsl:for-each select="//InvoiceLine">
    <tr>
        <td><!-- XSD: ItemDescription --><xsl:value-of select="ItemDescription"/></td>
        <td><!-- XSD: Quantity --><xsl:value-of select="Quantity"/></td>
        <td><!-- XSD: UnitPriceWithoutTax --><xsl:value-of select="UnitPriceWithoutTax"/></td>
        <td><!-- XSD: TotalCost --><xsl:value-of select="TotalCost"/></td>
    </tr>
</xsl:for-each>
</table>

<!-- TOTALES -->
<div class="right">
<p>Base: <xsl:value-of select="//InvoiceTotals/TotalGrossAmountBeforeTaxes"/><!-- XSD: TotalGrossAmountBeforeTaxes --> €</p>
<p>IGIC: <xsl:value-of select="//InvoiceTotals/TotalTaxOutputs"/><!-- XSD: TotalTaxOutputs --> €</p>
<p><b>Total: <xsl:value-of select="//InvoiceTotals/InvoiceTotal"/><!-- XSD: InvoiceTotal --> €</b></p>
</div>

<!-- PAGO -->
<h2>Pago</h2>

<p><b>Forma de pago: </b>
    <xsl:choose>
        <xsl:when test="//PaymentDetails/Installment/PaymentMeans = '04'">
            <p>Transferencia bancaria</p>
            <p><b>IBAN: </b>
                <xsl:value-of select="//PaymentDetails/Installment/AccountToBeCredited/IBAN"/>
            <!-- XSD: IBAN -->
            </p>
        </xsl:when>
        <xsl:otherwise>
            <p><xsl:value-of select="//PaymentDetails/Installment/PaymentMeans"/></p>
        </xsl:otherwise>
    </xsl:choose>
</p>
<!-- XSD: PaymentMeans -->
<!-- (Condición: si valor = '04' → Transferencia bancaria) -->


</div>
</body>
</html>

</xsl:template>
</xsl:stylesheet>