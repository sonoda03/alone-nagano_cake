class Public::AddressesController < ApplicationController
  # authenticateは認証するという意味
   before_action :authenticate_customer!

  def index
    # byebug
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to request.referer, notice: "新規登録完了しました"
    else
      @addresses = current_customer.addresses.all
      render "index"
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      redirect_to addresses_path, notice: "更新完了しました。"
    else
      @address =  Address.find(params[:id])
      render "edit"
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to request.referer
  end

  private

  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end

end