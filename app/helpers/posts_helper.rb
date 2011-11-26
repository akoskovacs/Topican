module PostsHelper
  def format_text(text)
    doc = RDiscount.new(text.to_s, :filter_html, :smart)
    return doc.to_html
  end
end
