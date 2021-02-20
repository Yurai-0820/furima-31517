class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :items, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  # def destroy
  #   if @item.destroy
  #     redirect_to root_path
  #   else
  #     redirect_to root_path
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name,:description ,:category_id ,:condition_id ,:shipping_charge_id ,:prefecture_id ,:days_to_ship_id ,:price).merge(user_id: current_user.id)
  end
def items
    @item = Item.find(params[:id])
  end

end

