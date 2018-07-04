class Client::ProductsController < ApplicationController
  def index
    response = Unirest.get("localhost:3000/api/products")
    @products = reponse.body
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

   def show
    product_id = params[:id]
    response = Unirest.get("localhost:3000/api/products/#{product_id}")
    @product = response.body
    render "show.html.erb"
  end

    def create
    # take in the parameters
    # make a web request to the API to create the new thing
    response = Unirest.post("localhost:3000/api/products", parameters:
      {
        input_name: params[:input_name],
        input_price: params[:input_price],
        input_image_url: params[:input_image_url],
        input_description: params[:input_description]
      }
    )
    @product = response.body
    # show the newly created recipe to the user in HTML
    render "show.html.erb"
  end
end