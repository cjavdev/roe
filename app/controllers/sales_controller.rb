class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to @sale
    else
    end
  end

  def index
    @sales = current_user.sales
  end

  private

  def sale_params
    params.require(:sale).permit(items: [])
  end
end
