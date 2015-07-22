class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = current_user.items.create(item_params)

    if @item.save 
      flash[:notice] = "Item was saved"
      redirect_to current_user
    else
      flash[:error] = "There was an error saving your item, please try again."
      redirect_to current_user
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
   
end


