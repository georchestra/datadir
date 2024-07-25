<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:gco="http://standards.iso.org/iso/19115/-3/gco/1.0"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:mdb="http://standards.iso.org/iso/19115/-3/mdb/2.0"
                xmlns:mcc="http://standards.iso.org/iso/19115/-3/mcc/1.0"
                xmlns:mri="http://standards.iso.org/iso/19115/-3/mri/1.0"
                xmlns:cit="http://standards.iso.org/iso/19115/-3/cit/2.0"
                xmlns:gex="http://standards.iso.org/iso/19115/-3/gex/1.0"
                xmlns:mrs="http://standards.iso.org/iso/19115/-3/mrs/1.0"
                xmlns:lan="http://standards.iso.org/iso/19115/-3/lan/1.0"
                xmlns:gcx="http://standards.iso.org/iso/19115/-3/gcx/1.0"
                xmlns:mrd="http://standards.iso.org/iso/19115/-3/mrd/1.0"
                xmlns:mrl="http://standards.iso.org/iso/19115/-3/mrl/2.0"
                version="2.0"
                exclude-result-prefixes="#all">

  <!--
  Default template to apply MetadataRecordProperties.java properties to a record template adhering to http://schemas.opengis.net/csw/2.0.2/profiles/apiso/1.0.0/apiso.xsd
   -->

  <!--  <xsl:strip-space elements="*" xmlns="http://www.isotc211.org/2005/gmd" />-->
  <xsl:output indent="yes" standalone="yes" />

  <!-- Whole document used as xsl parameter, see sample_md_properties.xml for an example of its contents -->
  <xsl:param name="props" />

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="//mdb:metadataIdentifier/mcc:MD_Identifier/mcc:code/gco:CharacterString">
    <gco:CharacterString>
      <xsl:value-of select="$props//metadataId" />
    </gco:CharacterString>
  </xsl:template>

  <xsl:template match="//mdb:dateInfo[1]/cit:CI_Date/cit:date/gco:DateTime">
    <gco:DateTime>
      <xsl:value-of select="format-dateTime(current-dateTime(), '[Y0001]-[M01]-[D01]T[h01]:[m01]:00.295346Z')" />
    </gco:DateTime>
  </xsl:template>

  <xsl:template match="//mdb:dateInfo[2]/cit:CI_Date/cit:date/gco:DateTime">
    <gco:DateTime>
      <xsl:value-of select="format-dateTime(current-dateTime(), '[Y0001]-[M01]-[D01]T[h01]:[m01]:00.295346Z')" />
    </gco:DateTime>
  </xsl:template>

  <xsl:template
          match="//mdb:identificationInfo/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:title/gco:CharacterString">
    <gco:CharacterString>
      <xsl:value-of select="$props//title" />
    </gco:CharacterString>
  </xsl:template>

  <xsl:template match="//mdb:identificationInfo/mri:MD_DataIdentification/mri:abstract/gco:CharacterString">
    <gco:CharacterString>
      <xsl:value-of select="$props//abstract" />
    </gco:CharacterString>
  </xsl:template>

  <xsl:template match="//mdb:identificationInfo/mri:MD_DataIdentification/mri:descriptiveKeywords">
    <mri:descriptiveKeywords>
      <mri:MD_Keywords>
        <xsl:for-each select="$props//keywords//keyword">
          <mri:keyword>
            <gco:CharacterString>
              <xsl:value-of select="." />
            </gco:CharacterString>
          </mri:keyword>
        </xsl:for-each>
        <mri:type>
          <mri:MD_KeywordTypeCode codeList="http://standards.iso.org/iso/19115/resources/Codelists/cat/codelists.xml#MD_KeywordTypeCode" codeListValue="theme"/>
        </mri:type>
        <mri:thesaurusName>
          <cit:CI_Citation>
            <cit:title>
              <gcx:Anchor xlink:href="https://${FQDN}/thematique/categories">Catégories</gcx:Anchor>
            </cit:title>
            <cit:date>
              <cit:CI_Date>
                <cit:date>
                  <gco:Date>2024-05-14</gco:Date>
                </cit:date>
                <cit:dateType>
                  <cit:CI_DateTypeCode codeList="http://standards.iso.org/iso/19115/resources/Codelists/cat/codelists.xml#CI_DateTypeCode" codeListValue="publication"/>
                </cit:dateType>
              </cit:CI_Date>
            </cit:date>
            <cit:date>
              <cit:CI_Date>
                <cit:date>
                  <gco:Date>2024-05-14</gco:Date>
                </cit:date>
                <cit:dateType>
                  <cit:CI_DateTypeCode codeList="http://standards.iso.org/iso/19115/resources/Codelists/cat/codelists.xml#CI_DateTypeCode" codeListValue="publication"/>
                </cit:dateType>
              </cit:CI_Date>
            </cit:date>
            <cit:identifier>
              <mcc:MD_Identifier>
                <mcc:code>
                  <gcx:Anchor xlink:href="https://${FQDN}/geonetwork/srv/api/registries/vocabularies/external.theme.thesaurus_mot_cle_thematique_categories">geonetwork.thesaurus.external.theme.thesaurus_mot_cle_thematique_categories</gcx:Anchor>
                </mcc:code>
              </mcc:MD_Identifier>
            </cit:identifier>
          </cit:CI_Citation>
        </mri:thesaurusName>
      </mri:MD_Keywords>
    </mri:descriptiveKeywords>
  </xsl:template>


  <xsl:template
          match="//mdb:identificationInfo/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:date[1]/cit:CI_Date/cit:date/gco:Date">
    <gco:Date>
      <xsl:value-of select="$props//creationDate" />
    </gco:Date>
  </xsl:template>
  <xsl:template
          match="//mdb:identificationInfo/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:date[2]/cit:CI_Date/cit:date/gco:Date">
    <gco:Date>
      <xsl:value-of select="$props//metadataPublicationDate" />
    </gco:Date>
  </xsl:template>

  <xsl:template
          match="//mdb:metadataLinkage/cit:CI_OnlineResource/cit:linkage/gco:CharacterString">
    <gco:CharacterString>
      <xsl:value-of select="$props//dataIdentifier" />
    </gco:CharacterString>
  </xsl:template>

  <xsl:template
          match="//mdb:identificationInfo/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:geographicElement/gex:EX_GeographicBoundingBox">
    <gex:EX_GeographicBoundingBox>
      <gex:westBoundLongitude>
        <gco:Decimal>
          <xsl:value-of select="$props//westBoundLongitude" />
        </gco:Decimal>
      </gex:westBoundLongitude>
      <gex:eastBoundLongitude>
        <gco:Decimal>
          <xsl:value-of select="$props//eastBoundLongitude" />
        </gco:Decimal>
      </gex:eastBoundLongitude>
      <gex:southBoundLatitude>
        <gco:Decimal>
          <xsl:value-of select="$props//southBoundLatitude" />
        </gco:Decimal>
      </gex:southBoundLatitude>
      <gex:northBoundLatitude>
        <gco:Decimal>
          <xsl:value-of select="$props//northBoundLatitude" />
        </gco:Decimal>
      </gex:northBoundLatitude>
    </gex:EX_GeographicBoundingBox>
  </xsl:template>

  <xsl:template
          match="//mdb:identificationInfo/mri:MD_DataIdentification/mri:spatialRepresentationType/mcc:MD_SpatialRepresentationTypeCode/@codeListValue">
    <xsl:attribute name="codeListValue">
      <xsl:value-of select="$props//spatialRepresentation" />
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="//mdb:identificationInfo/mri:MD_DataIdentification/mri:spatialResolution">
    <mri:spatialResolution>
      <mri:MD_Resolution>
        <mri:equivalentScale>
          <mri:MD_RepresentativeFraction>
            <mri:denominator>
              <gco:Integer>
                <xsl:value-of select="$props//spatialResolution" />
              </gco:Integer>
            </mri:denominator>
          </mri:MD_RepresentativeFraction>
        </mri:equivalentScale>
      </mri:MD_Resolution>
    </mri:spatialResolution>
  </xsl:template>

  <xsl:template match="//mdb:identificationInfo/mri:MD_DataIdentification/mri:pointOfContact">
    <mri:pointOfContact>
      <xsl:call-template name="contactInfo">
        <xsl:with-param name="individualName" select="$props//datasetResponsibleParty//individualName" />
        <xsl:with-param name="organizationName"
                        select="$props//datasetResponsibleParty//organizationName" />
        <xsl:with-param name="deliveryPoint"
                        select="$props//datasetResponsibleParty//address//deliveryPoint" />
        <xsl:with-param name="city" select="$props//datasetResponsibleParty//address//city" />
        <xsl:with-param name="postalCode" select="$props//datasetResponsibleParty//address//postalCode" />
        <xsl:with-param name="country" select="$props//datasetResponsibleParty//address//country" />
        <xsl:with-param name="email" select="$props//datasetResponsibleParty//email" />
        <xsl:with-param name="protocol" select="$props//datasetResponsibleParty//protocol" />
        <xsl:with-param name="linkage" select="$props//datasetResponsibleParty//linkage" />
      </xsl:call-template>
    </mri:pointOfContact>
  </xsl:template>

  <xsl:template match="//mdb:contact">
    <mdb:contact>
      <xsl:call-template name="contactInfo">
        <xsl:with-param name="individualName" select="$props//metadataResponsibleParty//individualName" />
        <xsl:with-param name="organizationName"
                        select="$props//metadataResponsibleParty//organizationName" />
        <xsl:with-param name="deliveryPoint"
                        select="$props//metadataResponsibleParty//address//deliveryPoint" />
        <xsl:with-param name="city" select="$props//metadataResponsibleParty//address//city" />
        <xsl:with-param name="postalCode" select="$props//metadataResponsibleParty//address//postalCode" />
        <xsl:with-param name="country" select="$props//metadataResponsibleParty//address//country" />
        <xsl:with-param name="email" select="$props//metadataResponsibleParty//email" />
        <xsl:with-param name="protocol" select="$props//metadataResponsibleParty//protocol" />
        <xsl:with-param name="linkage" select="$props//metadataResponsibleParty//linkage" />
      </xsl:call-template>
    </mdb:contact>
  </xsl:template>

  <xsl:template
          match="//mdb:resourceLineage/mrl:LI_Lineage/mrl:statement/gco:CharacterString">
    <gco:CharacterString>
      <xsl:value-of select="$props//lineage" />
    </gco:CharacterString>
  </xsl:template>

  <xsl:template match="//mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/@codeListValue">
    <xsl:attribute name="codeListValue">
      <xsl:value-of select="$props//resourceType" />
    </xsl:attribute>
  </xsl:template>

  <xsl:template
          match="//mdb:distributionInfo/mrd:MD_Distribution/mrd:transferOptions">
    <mrd:transferOptions>
        <mrd:MD_DigitalTransferOptions>
        <xsl:for-each select="$props//onlineResources//onlineResource">
          <mrd:onLine>
            <xsl:call-template name="onlineResource">
              <xsl:with-param name="linkage" select="linkage" />
              <xsl:with-param name="protocol" select="protocol" />
              <xsl:with-param name="name" select="name" />
              <xsl:with-param name="description" select="description" />
            </xsl:call-template>
          </mrd:onLine>
        </xsl:for-each>
        </mrd:MD_DigitalTransferOptions>
    </mrd:transferOptions>
  </xsl:template>

  <xsl:template match="//mdb:defaultLocale/lan:PT_Locale/lan:characterEncoding/lan:MD_CharacterSetCode/@codeListValue">
    <xsl:attribute name="codeListValue">
      <xsl:value-of select="$props//charsetEncoding" />
    </xsl:attribute>
  </xsl:template>

  <xsl:template
          match="//mdb:referenceSystemInfo/mrs:MD_ReferenceSystem/mrs:referenceSystemIdentifier/mcc:MD_Identifier/mcc:code">
    <mcc:code>
      <gco:CharacterString>
        <xsl:value-of select="$props//coordinateReferenceSystem" />
      </gco:CharacterString>
    </mcc:code>
  </xsl:template>

  <!-- Creates a CI_ResponsibleParty -->
  <xsl:template name="contactInfo">
    <xsl:param name="individualName" />
    <xsl:param name="organizationName" />
    <xsl:param name="deliveryPoint" />
    <xsl:param name="city" />
    <xsl:param name="postalCode" />
    <xsl:param name="country" />
    <xsl:param name="email" />
    <xsl:param name="protocol" />
    <xsl:param name="linkage" />
    <cit:CI_Responsibility>
      <cit:role>
        <cit:CI_RoleCode codeList="http://standards.iso.org/iso/19115/resources/Codelists/cat/codelists.xml#CI_RoleCode" codeListValue="pointOfContact"/>
      </cit:role>
      <cit:party>
        <cit:CI_Individual>
          <cit:name>
            <gco:CharacterString><xsl:value-of select="$individualName" /></gco:CharacterString>
          </cit:name>
          <cit:contactInfo>
            <cit:CI_Contact>
              <cit:address>
                <cit:CI_Address>
                  <cit:deliveryPoint>
                    <gco:CharacterString><xsl:value-of select="$deliveryPoint" /></gco:CharacterString>
                  </cit:deliveryPoint>
                  <cit:city>
                    <gco:CharacterString><xsl:value-of select="$city" /></gco:CharacterString>
                  </cit:city>
                  <cit:postalCode>
                    <gco:CharacterString><xsl:value-of select="$postalCode" /></gco:CharacterString>
                  </cit:postalCode>
                  <cit:country>
                    <gco:CharacterString><xsl:value-of select="$country" /></gco:CharacterString>
                  </cit:country>
                  <cit:electronicMailAddress>
                    <gco:CharacterString><xsl:value-of select="$email" /></gco:CharacterString>
                  </cit:electronicMailAddress>
                </cit:CI_Address>
              </cit:address>
              <cit:onlineResource>
                <cit:CI_OnlineResource>
                  <cit:linkage>
                    <gco:CharacterString>
                      <xsl:value-of select="$linkage" />
                    </gco:CharacterString>
                  </cit:linkage>
                  <cit:protocol>
                    <gco:CharacterString><xsl:value-of select="$protocol" /></gco:CharacterString>
                  </cit:protocol>
                  <cit:name>
                    <gco:CharacterString><xsl:value-of select="$organizationName" /></gco:CharacterString>
                  </cit:name>
                </cit:CI_OnlineResource>
              </cit:onlineResource>
            </cit:CI_Contact>
          </cit:contactInfo>
        </cit:CI_Individual>
      </cit:party>
    </cit:CI_Responsibility>
  </xsl:template>


  <!-- creates a CI_OnlineResource with the given parameters -->
  <xsl:template name="onlineResource">
    <xsl:param name="linkage" />
    <xsl:param name="protocol" />
    <xsl:param name="name" />
    <xsl:param name="description" />
    <cit:CI_OnlineResource>
      <cit:linkage>
        <gco:CharacterString>
          <xsl:value-of select="$linkage" />
        </gco:CharacterString>
      </cit:linkage>
      <cit:protocol>
        <gco:CharacterString>
          <xsl:value-of select="$protocol" />
        </gco:CharacterString>
      </cit:protocol>
      <cit:name>
        <gco:CharacterString>
          <xsl:value-of select="$name" />
        </gco:CharacterString>
      </cit:name>
      <cit:description>
        <gco:CharacterString>
          <xsl:value-of select="$description" />
        </gco:CharacterString>
      </cit:description>
      <cit:function>
        <cit:CI_OnLineFunctionCode codeList="http://standards.iso.org/iso/19115/resources/Codelists/cat/codelists.xml#CI_OnLineFunctionCode" codeListValue="download"/>
      </cit:function>
    </cit:CI_OnlineResource>
  </xsl:template>

  <!--
    If uncommented, the following overrides the language set in the MD template with "eng"
    (which is the default value for datasetLanguage with the current java code).
    Not recommended !
    You should rather edit metadata_template.xml to set your prefered lang for the time being.
  -->
  <!--
  <xsl:template match="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:language/gmd:LanguageCode/@codeListValue">
    <xsl:attribute name="codeListValue">
      <xsl:value-of select="$props//datasetLanguage" />
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="gmd:MD_Metadata/gmd:language/gmd:LanguageCode/@codeListValue">
    <xsl:attribute name="codeListValue">
      <xsl:value-of select="$props//metadataLanguage" />
    </xsl:attribute>
  </xsl:template>
  -->

  <!--
    Generate one gmd:topicCategory/gmd:MD_TopicCategoryCode for each gmd:keyword/gco:CharacterString
    that matches an entry in rdf:Description rdf:about="<id>"/skos:prefLabel[text()] in inspire/themes.rdf
  -->

  <xsl:import href="inspire/topic_category.xsl"/>
  <xsl:template match="//mdb:identificationInfo/mri:MD_DataIdentification/mri:topicCategory">
    <xsl:call-template name="inspire_topic_category"/>
  </xsl:template>

</xsl:stylesheet>
