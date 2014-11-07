
class ProductSearchController < ApplicationController
  def index
    @select_product = Product.new(products_params)
  end
  def find
    # pull the search text from the search bar to start our query to factual server
    @products = factual.table("products-cpg").search(params[:query]).limit(10).rows
  end
  def add_to_case
    @select_product = Product.new(products_params)
    #@product = Product.new(:factual_id => params[:factual_id], params[:amazon_link], params[:brand], params[:product_name], params[:size], params[:upc], params[:ean13], params[:upc_e], params[:category], params[:avg_price], params[:manufacturer], params[:ingredients], params[:short_description], params[:full_description], params[:image_urls], params[:date_first_use], params[:date_expired], params[:like_or_not], params[:review], params[:user_id])
    #@product = Product.new(params[:factual_id], params[:amazon_link], params[:brand], params[:product_name], params[:size], params[:upc], params[:ean13], params[:upc_e], params[:category], params[:avg_price], params[:manufacturer], params[:ingredients], params[:short_description], params[:full_description], params[:image_urls], params[:date_first_use], params[:date_expired], params[:like_or_not], params[:review], params[:user_id])
    # CROSS WALK LOOKUP API CALL FOR EACH PRODUCTS FOR LINKS TO AMAZON
    # AND ONLINE MERCHANDISERS
    # Now it's time to make another API CALL
    #@product_crosswalk = factual.table("products-crosswalk").search(@select_product['factual_id']).rows
    #@amazon = @product_crosswalk.find { |cw| cw['namespace'] == 'amazon' }
  end

  def create
    @product = Product.new(products_params)
    @product.user_id = current_user.id.to_s
    raise @product.inspect
    # IMAGE ISSUE WITH ADDING OBJECT INTO DATABASE NOT FIXED.
    if params[:product]['image_urls']
      params[:product]['image_urls'].each_with_index do |i,index|
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
      params.require(:select_product).permit(:amazon_ASIN, :factual_id, :amazon_link, :brand, :product_name, :size, :upc, :ean13, :upc_e, :category, :avg_price, :manufacturer, :ingredients, :short_description, :full_description, :image_urls, :date_first_use, :date_expired, :like_or_not, :review, :user_id)
    end
end