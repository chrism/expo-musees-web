module ActualitesHelper
  def small_image(url)
    prepend = "http://expomusees.orange.com/getimage.php?image="
    type = "news"
    "#{prepend}#{url}&type=#{type}&format=small"
  end
end
