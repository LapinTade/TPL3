<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="2.0" id="fr0-2-latex"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd">

  <xsl:output method="text" encoding="ISO-8859-1"/>

  <xsl:variable name="eol" select="'&#10;'"/>

  <xsl:strip-space elements="*"/>

  <xsl:template match="poemefr0">
    <xsl:value-of select="'\documentclass{article}',$eol,
                          '\usepackage[T1]{fontenc}',$eol,
                          '\usepackage[latin1]{inputenc}',$eol,$eol"
                  separator=""/>
    <xsl:apply-templates select="preambule"/>
    <xsl:value-of select="'\begin{document}',$eol,$eol,'\maketitle',$eol,$eol"
                  separator=""/>
    <xsl:apply-templates select="corps"/>
    <xsl:value-of select="'\end{document}',$eol" separator=""/>
  </xsl:template>

  <xsl:template match="preambule">
    <xsl:value-of
      select="'\title{',titre,' \\ (\emph{in} ',recueil,')}',$eol,'\author{'"
      separator=""/>
    <xsl:apply-templates select="auteur"/>
    <xsl:value-of select="'}',$eol,'\date{',date,'}',$eol,$eol" separator=""/>
  </xsl:template>

  <xsl:template match="auteur">
    <xsl:if test="prenom">
      <xsl:value-of select="prenom,' '" separator=""/>
    </xsl:if>
    <xsl:value-of select="nom"/>
    <xsl:if test="naissance and deces">
      <xsl:value-of select="' (',naissance,'--',deces,')'" separator=""/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="corps">
    <xsl:value-of select="concat('\begin{verse}',$eol)"/>
    <xsl:apply-templates/>
    <xsl:value-of select="concat('\end{verse}',$eol,$eol)"/>
  </xsl:template>

  <xsl:template match="strophe">
    <xsl:apply-templates/>
    <xsl:value-of select="$eol"/>
  </xsl:template>

  <xsl:template match="ligne">
    <xsl:apply-templates/>
    <xsl:value-of select="if (position() lt last()) then ' \\' else (),$eol"
                  separator=""/>
  </xsl:template>

  <xsl:template match="r" as="xsd:string">
    <xsl:text>\qquad </xsl:text>
  </xsl:template>

</xsl:stylesheet>
