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

  def at_notification(content, options = {})
    content.gsub(/(^|[^a-zA-Z0-9_!#\$%&*@＠])(@|＠)([a-zA-Z0-9][a-zA-Z0-9_-]{1,14})/) do
      %(<a href="#{user_url($3)}" class="#{options[:class]}">#{$1 + $2 + $3}</a>)
    end
  end
end
