class ProductSearchController < ApplicationController
  def index
  end
  def find
    # pull the search text from the search bar to start our query to factual server
    @products = factual.table("products-cpg").search(params[:query]).rows
  end
end