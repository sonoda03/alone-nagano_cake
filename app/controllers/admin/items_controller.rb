class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
     @item_new = Item.new
  end

  def create
     @item_new = Item.new(item_params)
    if @item_new.save
      redirect_to admin_item_path(params[:id])
      flash[:notice] = "商品登録完了しました。"
    else
      render 'new'
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to admin_item_path(params[:id])
      flash[:notice] = "更新完了しました。"
    else
      render 'edit'
    end
  end

  private

  def item_params

    params.require(:item).permit(:name,:introduction,:unit_price,:is_on_sale)
  end

end
