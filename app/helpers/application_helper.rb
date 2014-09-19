module ApplicationHelper
  def api_image(url, type, format = "small")
    prepend = "http://expomusees.orange.com/getimage.php?image="
    "#{prepend}#{url}&type=#{type}&format=#{format}"
  end
end
