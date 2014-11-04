class HomeController < ApplicationController
  def index
    @factual_search = factual.table("products-cpg").search("conditioner Pantene").rows
    # @factual_search = factual.table("products-cpg").search("shampoo").filters("brand" => "pantene").rows
  end
end
