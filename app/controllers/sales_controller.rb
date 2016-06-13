class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def index
    @sales = current_user.sales
  end
end
