module StringUtils

  def strip_whitespace(text)
    if text==nil
      text
    else
      text.gsub(/[\u0080-\u00ff]/, "").strip
    end
  end

end