class Client::CartedProductsController < ApplicationController
  def new
    render "new.html.erb"
  end

  def index
    response = Unirest.get("http://localhost:3000/api/carted_products")
    @carted_products = response.body
    render "index.html.erb"
  end

  def create
    # intake the params from the form
    client_params = {
      product_id: params[:product_id],
      quantity: params[:quantity]
    }
    # make a unirest request to the api
    response = Unirest.post("localhost:3000/api/carted_products", parameters: client_params)
    @carted_product = response.body
    redirect_to "/client/carted_products"
  end
end
