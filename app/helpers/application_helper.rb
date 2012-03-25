module ApplicationHelper
  def markdown(content, options = {})
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    coderay(markdown.render(content)).html_safe
  end

  def coderay(content, options = {})
    defaults = {
      :line_number => :table,
    }

    content.gsub(/\*{3,}(.+?)\n(.+?)\*{3,}/m) do
      Coderay.scan($2, $1).div(defaults.merge(options))
    end
  end
end
