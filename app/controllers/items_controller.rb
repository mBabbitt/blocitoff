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
    @item = Item.find(params[:item_id])
    @user = @item.user
    authorize @item
    if @item.destroy
      flash[:notice] = "Item deleted successfully."
    else
      flash[:error] = "There was an error deleting item."
    end

    respond_to do |format|
      format.html
      format.js {render :nothing => true}
    end
    
  
  private

  def item_params
    params.require(:item).permit(:name, :user_id)
  end
   
end


