class HomeController < ApplicationController
  def index
    @factual_search = factual.table("products-cpg").search("conditioner Pantene").rows
  end
end
