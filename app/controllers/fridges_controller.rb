class FridgesController < ApplicationController
  before_action :set_invite_notification, only: [:index, :show]

  def index
    @fridges = current_user.fridges
  end

  def show
    if !current_user.fridges.empty?
      @fridge = Fridge.find(params[:id])
    else
      @fridge = Fridge.new
    end
  end

  def create
    @fridge = Fridge.new(fridge_params)
    if @fridge.save
      @fridge_user = FridgeUser.new(user: current_user, fridge: @fridge)
      @fridge_user.save
      redirect_to fridges_path, notice: 'Fridge was successfully created.'
    else
      render :show
    end
  end

  def update
    @fridge = Fridge.find(params[:id])
    @fridge.update(fridge_params)
    redirect_to fridge_path(@fridge)
  end

  def destroy
    @fridge = Fridge.find(params[:id])
    @fridge.destroy
    redirect_to fridges_path, status: :see_other
  end

  private

  def fridge_params
    params.require(:fridge).permit(:name)
  end

  def set_invite_notification
    @invite_notification = InviteNotification.where(receiver_user_id: current_user.id)
  end
end
