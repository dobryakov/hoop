xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do

    for gallery in @galleries
      xml.item do
        xml.link gallery.url
        xml.guid gallery.url
        xml.description gallery.description.length > 0 ? gallery.description : (gallery.paysite.title + ' gallery #' + gallery.id.to_s).strip
        xml.pubDate gallery.created_at.to_s(:rfc822)
      end
    end

  end
end