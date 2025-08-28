<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="2.0" 
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:gmd="http://www.isotc211.org/2005/gmd" 
      xmlns:srv="http://www.isotc211.org/2005/srv" 
      xmlns:gco="http://www.isotc211.org/2005/gco" 
      xmlns:xlink="http://www.w3.org/1999/xlink" 
      xmlns:gmx="http://www.isotc211.org/2005/gmx" 
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
      xmlns:gfc="http://www.isotc211.org/2005/gfc" 
      xmlns:gts="http://www.isotc211.org/2005/gts" 
      xmlns:gml="http://www.opengis.net/gml" 
      xmlns:geonet="http://www.fao.org/geonetwork">

 <xsl:output omit-xml-declaration="yes" indent="yes"/>
 <xsl:param name="URL">gmd:URL</xsl:param>
 <xsl:param name="urlPrefixSearchDemo">https://demo.georchestra.org</xsl:param>
 <xsl:param name="urlPrefixCibleLocal">https://georchestra-127-0-0-1.nip.io</xsl:param>
 
 <xsl:template match="@* | node()">
   <xsl:copy>
	
      
	<xsl:choose>
		<xsl:when test="name()=$URL">
			<!-- Process N°1
			     Portail public transformation des urls des capacités WMS et WFS  
			     portail.sig   en public.sig 	-->
			<xsl:if test="(contains(text(), $urlPrefixSearchDemo))">
				<xsl:value-of select="concat($urlPrefixCibleLocal,substring-after(text(),$urlPrefixSearchDemo))">
				</xsl:value-of>
			</xsl:if>
			<xsl:if test="not(contains(text(), $urlPrefixSearchDemo))">
				<xsl:apply-templates select="@* | node()"/>
			</xsl:if>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="@* | node()"/>     				
		</xsl:otherwise>   
	</xsl:choose>
   </xsl:copy>
 </xsl:template>
  
  
 <xsl:template match="gmd:onLine[(gmd:CI_OnlineResource/gmd:protocol/gco:CharacterString) = 'OGC:GML']" priority="1"/>
  
</xsl:stylesheet>
