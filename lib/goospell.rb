require "goospell/version"
require "uri"
require "net/http"
require "net/https"
require "rexml-expansion-fix"

module Goospell
  def self.spell(full_text ='', lang='en', options={})
		options = { textalreadyclipped: 0,  ignoredups: 0, ignoredigits: 1, ignoreallcaps: 1 }.merge(options)
    out = {}
    unless full_text.empty?
      uri = URI("https://www.google.com/tbproxy/spell?lang=#{lang}&hl=#{lang}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      xml = '<?xml version="1.0" encoding="utf-8" ?>'
      xml << "<spellrequest textalreadyclipped=\"#{options['textalreadyclipped']}\" ignoredups=\"#{options['ignoredups']}\" ignoredigits=\"#{options['ignoredigits']}\" ignoreallcaps=\"#{options['ignoreallcaps']}\">"
      xml << "<text>#{full_text}</text>"
      xml << '</spellrequest>'
      header = {
        "MIME-Version"=>"1.0",
        "Content-type"=>"application/PTI26",
        "Content-transfer-encoding"=>"text",
        "Request-number"=>"1",
        "Document-type"=>"Request",
        "Interface-Version"=>"Test 1.4",
        "Connection"=>"close"
      } 
      res = http.post(uri.request_uri, xml, header).body
      doc = REXML::Document.new(res)
      doc.elements.each('spellresult/c') do |correction|
        #string = "asdfasf tehes"
        #format is <c o="8" l="5">these  the theory</c>
        variants = correction.text ? correction.text.split("\t") : []
        out.merge!({ full_text[correction.attributes['o'].to_i,correction.attributes['l'].to_i] => variants })
      end
    end
    out
  end
end
