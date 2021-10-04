class GadgetsController < ApplicationController
  def index
    @gadgets = Gadget.all.page(params[:page]).reverse_order
  end

  def show
    @gadget = Gadget.find(params[:id])
  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = Gadget.new(gadget_params)
    @gadget.user_id = current_user.id
    if @gadget.save
      redirect_to gadgets_path
    else
      redirect_to new_gadget_path
    end
  end

  def edit
    @gadget = Gadget.find(params[:id])
  end
  
  def update
    @gadget = Gadget.find(params[:id])
    if @gadget.update(gadget_params)
      redirect_to gadgets_path(@gadget)
    else
      redirect_to edit_gadget_path(gadget.id)
    end 
  end
  
  def destroy
    gadget = Gadget.find(params[:id])
    gadget.destroy
    redirect_to gadgets_path
  end

  private
  def gadget_params
    params.require(:gadget).permit(:name, :text, :image)
  end

end
