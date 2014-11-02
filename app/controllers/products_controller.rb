class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
   # make sure only admin can show all users
  before_action :make_sure_logged_in, only: [:create, :edit, :update, :new]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end  

  def create
    product = Product.new(params.require(:product).permit(:brand, :name, :volume, :sku, :price, :review, :like_or_not, :date_first_user, :expiration_date, :category))
    if product.save
      # the moment you sign up it logs  you in
      redirect_to makeupcases_path
    else
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    respond_to do |format|
      if @product.update(user_params)
        format.html { redirect_to @product, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  private
    def make_sure_logged_in
      if !current_user 
        redirect_to new_sessions_path
      end
    end
end