class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:edit, :update, :show, :destroy]
  layout "portfolio"

  def index
    @portfolio_items = Portfolio.all
    @page_title = "#{@page_title} | Portfolios"
    @seo_keywords = "#{@seo_keywords} | Portfolios"
  end

  def new
    @portfolio_item = Portfolio.new
    3.times {@portfolio_item.technologies.build}
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item was successfully lived.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @page_title = "#{@page_title} | #{@portfolio_item.title}"
    @seo_keywords = "#{@seo_keywords} | #{@portfolio_item.technologies}"
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully destroyed.' }
    end
  end

  private
    def set_portfolio
      @portfolio_item = Portfolio.find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(
                                        :title,
                                        :subtitle,
                                        :body,
                                        technologies_attributes: [:name]
                                      )
    end

end
