<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/" xmlns:flvc="info:flvc/manifest/v1" exclude-result-prefixes="#all">
    
    <xsl:output indent="yes"/>
    
    <xsl:strip-space elements="relatedItem note"/>
    
    <xsl:template match="/">
        <mods:modsCollection><xsl:apply-templates/></mods:modsCollection>
    </xsl:template>
    
    <xsl:template match="mods:mods">
        <xsl:variable name="identifier" select="mods:identifier[@IID]/text()"/>
        <xsl:result-document href="{$identifier}.xml" indent="yes" method="xml" omit-xml-declaration="yes" byte-order-mark="no">
            <mods xmlns="http://www.loc.gov/mods/v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/" xmlns:flvc="info:flvc/manifest/v1" xsi:schemaLocation="http://www.loc.gov/standards/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd">
                <xsl:apply-templates/>
            </mods>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="mods:mods/mods:titleInfo">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:name">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:originInfo">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:note">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:identifier">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:physicalDescription">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:abstract">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:typeOfResource">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:genre">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:subject">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:language">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:extension">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:location">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:recordInfo">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="mods:relatedItem">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>   
</xsl:stylesheet>