
class ProductSearchController < ApplicationController
  def index
  end
  def find
    # pull the search text from the search bar to start our query to factual server
    @products = factual.table("products-cpg").search(params[:query]).limit(10).rows
  end
  def add_to_case
    @select_product = params[:select_product]

    # CROSS WALK LOOKUP API CALL FOR EACH PRODUCTS FOR LINKS TO AMAZON
    # AND ONLINE MERCHANDISERS
    # Now it's time to make another API CALL
    #@product_crosswalk = factual.table("products-crosswalk").search(@select_product['factual_id']).rows
    #@amazon = @product_crosswalk.find { |cw| cw['namespace'] == 'amazon' }
  end

  def create
    raise params[:product].inspect
    @product = Product.new(products_params)
    @product.user_id = current_user.id.to_s
    # IMAGE ISSUE WITH ADDING OBJECT INTO DATABASE NOT FIXED.
    if params[:select_product]['image_urls']
      params[:select_product]['image_urls'].each_with_index do |i,index|
        @product.image_urls[index] = i
      end
    end

    if @product.save
      redirect_to products_path
    else
      redirect_to new_product_path
    end
  end
  private
  def products_params
      params.require(:select_product).permit(:factual_id, :amazon_link, :brand, :product_name, :size, :upc, :ean13, :upc_e, :category, :avg_price, :manufacturer, :ingredients, :short_description, :full_description, :image_urls, :date_first_use, :date_expired, :like_or_not, :review, :user_id)
    end
end