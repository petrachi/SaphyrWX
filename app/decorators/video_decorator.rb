class VideoDecorator < SaphyrWXK::Decorator::Base
  def transcript
    super.gsub(/\n/, '<br/>')
  end
end
