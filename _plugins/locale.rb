# Replace the sites locale with the pages language
Jekyll::Hooks.register [:pages, :documents], :post_convert do |doc|
  if doc.data.has_key?("lang")
    doc.site.config["locale"] = doc.data["lang"]
  end
end
