# frozen_string_literal: true

module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="alert alert-danger">
      <ul class="errors">
        #{messages}
      </ul>
    </div>
    HTML

    html.html_safe
  end
end
