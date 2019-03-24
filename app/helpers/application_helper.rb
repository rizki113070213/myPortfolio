module ApplicationHelper
  def login_helper
    if !user_signed_in?
      (link_to "LOG IN", new_user_session_path) +
      "<br>".html_safe +
      (link_to "SIGN UP", new_user_registration_path)
    else
      link_to "LOG OUT", destroy_user_session_path, method: :delete
    end
  end

  def source_helper
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end
end
