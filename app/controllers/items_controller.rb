class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def add_size
    @item = current_user.items.find(params[:id])
    @item.sizes << ItemSize.new(size: Integer(params[:size_id]))
    @item.save
    redirect_to @item
  end

  def remove_size
    @item = current_user.items.find(params[:id])
    @item.sizes.where(size: params[:size_id]).first.try(:delete)
    redirect_to @item
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to @item
    else
      flash.now[:errors] = @item.errors.full_messages
      render :new
    end
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def update
    @item = current_user.items.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      flash.now[:errors] = @item.errors.full_messages
      render :edit
    end
  end

  def index
    @items = current_user.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.archived = true
    @item.save
    redirect_to items_path
  end

  private

  def item_params
    params
      .require(:item)
      .permit(:photo, :name, :description, :collection_id, :public)
  end
end
