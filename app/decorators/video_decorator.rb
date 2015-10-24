class VideoDecorator < SaphyrWXK::Decorator::Base
  def embed_html
    view.content_tag :iframe, nil,
      id: 'yt_player',
      width: '100%',
      height: '100%',
      src: "//www.youtube.com/embed/#{ yt_id }?enablejsapi=1&html5=1",
      frameborder: '0',
      allowfullscreen: ''
  end

  def transcript
    super.gsub(/\n/, '<br/>')
  end
end
