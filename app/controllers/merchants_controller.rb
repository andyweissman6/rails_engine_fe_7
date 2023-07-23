class MerchantsController < ApplicationController
  def index
    response = Faraday.get('http://localhost:3000/api/v1/merchants')
    @merchants = JSON.parse(response.body, symbolize_names: true)[:data]
    #put [:data] b/c we know key is data bc we built this
    # require 'pry'; binding.pry
  end

  def show
    merchant_response = Faraday.get("http://localhost:3000/api/v1/merchants/#{params[:id]}")
    @merchant = JSON.parse(merchant_response.body, symbolize_names: true)

    items_response = Faraday.get("http://localhost:3000/api/v1/merchants/#{params[:id]}/items")
    @items = JSON.parse(items_response.body, symbolize_names: true)[:data]
  # require 'pry'; binding.pry
  end
end