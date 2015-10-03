class VideoDecorator < SaphyrWXK::Decorator::Base
  def embed
    view.content_tag :iframe, nil,
      width: 840,
      height: 500,
      src: "//www.youtube.com/embed/#{ super }?rel=0",
      frameborder: "0",
      allowfullscreen: ""
  end
end
