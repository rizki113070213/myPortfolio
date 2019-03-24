module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Muhammad Rizki's Website"
    @seo_keywords = "Muhammad Rizki"
  end
end
