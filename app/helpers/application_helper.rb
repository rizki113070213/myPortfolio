module ApplicationHelper
  def login_helper style=""
    if !user_signed_in?
      (link_to "Log In", new_user_session_path, class: "#{style} #{active? new_user_session_path}") +
      " ".html_safe +
      (link_to "Sign Up", new_user_registration_path, class: "#{style} #{active? new_user_registration_path}")
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

  def nav_items
    [
      {
        url: root_path,
        title: "Home"
      },
      {
        url: about_me_path,
        title: "About Me"
      },
      {
        url: contact_path,
        title: "Contact"
      },
      {
        url: blogs_path,
        title: "Blog"
      },
      {
        url: portfolios_path,
        title: "Portfolio"
      }
    ]
  end

  def nav_helper style, tag_type
    nav_links = ""
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href=#{item[:url]} class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Muhammad Rizki Portfolio", sticky: false)
  end
end
