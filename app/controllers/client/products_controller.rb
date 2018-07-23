class Client::ProductsController < ApplicationController
  def index
    client_params = {
      search_name: params[:client_search_name],
      sort_by: params[:client_sort_by]
    }
    response = Unirest.get("http://localhost:3000/api/products", parameters:
        client_params
    )
    @products = response.body
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                     name: params[:name],
                     price: params[:price],
                     description: params[:description],
                     supplier_id: params[:supplier_id]
                    }

    response = Unirest.post(
                            "http://localhost:3000/api/products",
                            parameters: client_params
                            )

    flash[:success] = "Successfully created Product"
    redirect_to "/client/products/"
  end

  def show
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render 'show.html.erb'
  end

  def edit
    response = Unirest.get("http://localhost:3000/api/products/#{params[:id]}")
    @product = response.body
    render 'edit.html.erb'
  end

  def update
    client_params = {
                     name: params[:name],
                     price: params[:price],
                     description: params[:description],
                     image_url: params[:image_url]
                    }

    response = Unirest.patch(
                            "http://localhost:3000/api/products/#{params[:id]}",
                            parameters: client_params
                            )

    flash[:success] = "Successfully updated Product"
    redirect_to "/client/products/#{params[:id]}"
  end

  def destroy
    response = Unirest.delete("http://localhost:3000/api/products/#{params['id']}")
    flash[:success] = "Successfully destroyed product"
    redirect_to "/client/products"
  end
end
class Client::ProductsController < ApplicationController
  def index
    client_params = {
      search_name: params[:client_search_name],
      sort_by: params[:client_sort_by]
    }
    response = Unirest.get("http://localhost:3000/api/products", parameters:
        client_params
    )
    @products = response.body
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                     name: params[:name],
                     price: params[:price],
                     description: params[:description],
                     supplier_id: params[:supplier_id]
                    }

    response = Unirest.post(
                            "http://localhost:3000/api/products",
                            parameters: client_params
                            )

    flash[:success] = "Successfully created Product"
    redirect_to "/client/products/"
  end

  def show
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render 'show.html.erb'
  end

  def edit
    response = Unirest.get("http://localhost:3000/api/products/#{params[:id]}")
    @product = response.body
    render 'edit.html.erb'
  end

  def update
    client_params = {
                     name: params[:name],
                     price: params[:price],
                     description: params[:description],
                     image_url: params[:image_url]
                    }

    response = Unirest.patch(
                            "http://localhost:3000/api/products/#{params[:id]}",
                            parameters: client_params
                            )

    flash[:success] = "Successfully updated Product"
    redirect_to "/client/products/#{params[:id]}"
  end

  def destroy
    response = Unirest.delete("http://localhost:3000/api/products/#{params['id']}")
    flash[:success] = "Successfully destroyed product"
    redirect_to "/client/products"
  end
end
