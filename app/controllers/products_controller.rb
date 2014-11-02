class ProductsController < ApplicationController
  before_action :make_sure_logged_in, only: [:create, :edit, :update, :new, :destroy]
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
    @product = Product.new(params.require(:product).permit(:brand, :name, :size, :upc, :ean13, :upc_e, :category, :avg_price, :manufacturer, :ingredients, :short_description, :full_description, :image_urls, :date_first_use, :expiration_date, :like_or_not, :review, :user_id))
    if @product.save
      redirect_to makeupcases_path
    else
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
      if @product.update_attributes(params.require(:product).permit(:brand, :name, :size, :upc, :ean13, :upc_e, :category, :avg_price, :manufacturer, :ingredients, :short_description, :full_description, :image_urls, :date_first_use, :expiration_date, :like_or_not, :review, :user_id))
        redirect_to products_path
      else
        render 'edit'
      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
  
  private
    def make_sure_logged_in
      if !current_user 
        redirect_to new_sessions_path
      end
    end
end