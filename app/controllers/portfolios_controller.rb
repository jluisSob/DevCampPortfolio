class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
    # @portfolio_items = Portfolio.angular
    # @portfolio_items = Portfolio.ruby_on_rails_portfolio_items
    # @portfolio_items = Portfolio.where(subtitle: 'Angular')
    # @portfolio_items = Portfolio.where(subtitle: 'Ruby on Rails')
  end

  def angular
    @porfoli_angular_items = Portfolio.angular
  end

  def new
    @portfolio_items = Portfolio.new
    3.times { @portfolio_items.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_items = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Porfolio was successfully updated." }
      else
        format.html { render :edit}
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    # Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])

    # Destroy/delete the record
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Portfolio was destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                     )
  end
end
