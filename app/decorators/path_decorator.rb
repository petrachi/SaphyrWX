class PathDecorator < SaphyrWXK::Decorator::Base

  def videos
    super.decorate(view_context: view)
  end

  # def svg_path
  #   send "#{tag.underscore}_svg_path"
  # end
  #
  # def saphyr_concepts_svg_path
  #   ".--"
  #   view.content_tag :p do
  #     view.content_tag(:i, "saleut") +
  #     view.content_tag(:i, "saleut")
  #   end
  # end
  #
  # def saphyr_compiler_svg_path
  #   "-.."
  # end
  #
  # def ruby_challenges_svg_path
  #   ".-.-"
  # end
end
