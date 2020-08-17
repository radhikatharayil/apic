<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:dp="http://www.datapower.com/extensions"
    xmlns:dpquery="http://www.datapower.com/param/query"    
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    extension-element-prefixes="dp"
    exclude-result-prefixes="dp"
    version="1.1">
    
    <xsl:template match="/">
        
        <xsl:variable name="url" select="dp:variable('var://service/URI')"/>
        <xsl:variable name="id" select="substring-after($url,'/projects/')"/>
        
        <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:dem="http://soap.example.com/demoService/">
            <soapenv:Header/>
            <soapenv:Body>
                <dem:deleteProjectRequest>
                    <dem:id><xsl:value-of select="$id"/></dem:id>
                </dem:deleteProjectRequest>
            </soapenv:Body>
        </soapenv:Envelope>
        
        <dp:set-variable name="'var://context/rest/soap-action'" value="'http://soap.example.com/demoService/deleteProject'"/>
        
    </xsl:template>
</xsl:stylesheet>