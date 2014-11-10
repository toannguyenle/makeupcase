class ProductsController < ApplicationController
  before_action :make_sure_logged_in, only: [:index, :create, :edit, :update, :new, :destroy]
  def index
    @products = Product.where('user_id' => current_user.id.to_s)
    @my_item_count = @products.count
    @my_exp_items = @products.where(:date_expired => { :$lte => Date.today } )
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end  

  def create
    @product = Product.new(products_params)
    @product.user_id = current_user.id.to_s
    if @product.save
      redirect_to products_path
    else
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(products_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end
  # SET LIKE AND UNLIKE
  def set_like
    @product = Product.find(params[:id])
    if @product.like_or_not
      @product.like_or_not = false
    else
      @product.like_or_not = true
    end
    @product.save!
    
    redirect_to products_path
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
    def products_params
      params.require(:product).permit(:rating, :amazon_ASIN, :factual_id, :amazon_link, :brand, :product_name, :size, :upc, :ean13, :upc_e, :category, :avg_price, :manufacturer, :ingredients, :short_description, :full_description, :image_urls, :date_first_use, :date_expired, :like_or_not, :review, :user_id)
    end
end