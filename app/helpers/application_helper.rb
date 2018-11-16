module ApplicationHelper
  def avatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def markdown(markdown)
    CommonMarker.render_html(markdown, :DEFAULT).html_safe
  end
end
