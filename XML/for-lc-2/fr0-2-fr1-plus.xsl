<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="2.0" id="fr0-2-fr1-plus"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd">

  <xsl:output method="xml" encoding="ISO-8859-1" doctype-system="poemefr1.dtd"
              indent="yes"/>

  <xsl:strip-space elements="*"/>

  <xsl:template match="poemefr0" as="element(poemefr1)">
    <poemefr1><xsl:apply-templates/></poemefr1>
  </xsl:template>

  <xsl:template match="preambule" as="element(preambule)">
    <preambule>
      <xsl:for-each select="titre | recueil | date | auteur/*">
        <xsl:attribute name="{name()}">
          <xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:for-each>
    </preambule>
  </xsl:template>

  <xsl:template match="corps" as="element(corps)">
    <corps><xsl:apply-templates/></corps>
  </xsl:template>

  <xsl:template match="strophe" as="element(ligne)+">
    <xsl:apply-templates select="ligne[1]">
      <xsl:with-param name="debutdestrophe" select="true()" as="xsd:boolean"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="ligne[position() &gt; 1]"/>
  </xsl:template>

  <xsl:template match="ligne" as="element(ligne)">
    <xsl:param name="debutdestrophe" select="false()" as="xsd:boolean"/>
    <ligne>
      <xsl:if test="$debutdestrophe">
        <xsl:attribute name="strophe">oui</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </ligne>
  </xsl:template>

  <xsl:template match="r" as="attribute(r)">
    <xsl:attribute name="r">6pt</xsl:attribute>
  </xsl:template>

</xsl:stylesheet>
