module ApplicationHelper
  def login_helper style
    if !user_signed_in?
      (link_to "Log In", new_user_session_path, class: style) +
      " ".html_safe +
      (link_to "Sign Up", new_user_registration_path, class: style)
    else
      link_to "Log Out", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    TigaribuLabsViewTool::Renderer.copyright 'Muhammad Rizki', 'All rights reserved'
  end
end
