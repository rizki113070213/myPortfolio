class TopicsController < ApplicationController
  before_action :set_sidebar_topics
  layout "blog"

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.published.page(params[:page]).per(5)
    end
  end

  private

  def set_sidebar_topics
    if logged_in?(:site_admin)
      @sidebar_topics = Topic.with_blogs ""
    else
      @sidebar_topics = Topic.with_blogs "draft"
    end
  end
end
