class ItemsController < ApplicationController
  def create
    # @user = User.find(params[:user_id])
    @item = current_user.items.build(item_params)

    if @item.save 
      flash[:notice] = "Item was saved"
    else
      flash[:error] = "There was an error saving your item, please try again."
    end
    redirect_to current_user
  end

  def complete
    @item = Item.find(params[:item_id])
    @item.completed ? @item.completed = false : @item.completed = true
    if @item.save
      flash[:notice] = "Task completed successfully!"
    else
      flash[:error] = "Your task failed to complete"
    end
    redirect_to current_user
  end

   def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item deleted successuflly!"
    else
      flash[:notice] = "Something went wrong, try again please"
    end

    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :user_id)
  end
   
end


