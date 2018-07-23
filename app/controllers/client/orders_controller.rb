class Client::OrdersController < ApplicationController
  def show
    # get the data from the api and show it to the user
    order_id = params[:id]
    response = Unirest.get("localhost:3000/api/orders/#{order_id}")
    @order = response.body
    render "show.html.erb"
  end

  def create
    response = Unirest.post("localhost:3000/api/orders")
    order = response.body
    redirect_to "/client/orders/#{order['id']}"
  end
end
