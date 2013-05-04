module PictureHelper
  def picture(picture, size = nil, options = {})
    options.merge!({ class: size})
    content_tag(:figure, image_tag(picture.file.url(size), options))
  end
end
