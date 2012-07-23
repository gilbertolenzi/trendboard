require 'rubygems'
require 'sinatra'
require 'httparty'
require "json"

TOKEN = ''

get '/' do
  erb :index
end

get '/product' do
  content_type :json
  response = HTTParty.get("http://dw.notonthehighstreet.com/trends/products?timeframe=#{params[:timeframe]}&token=#{TOKEN}")
  response.body.to_json
end

get '/product/:id' do
  content_type :json
  response = HTTParty.get("http://dw.notonthehighstreet.com/trends/product/#{params[:id]}?timeframe=#{params[:timeframe]}&token=#{TOKEN}")
  response.body.to_json
end

get '/partner' do
  content_type :json
  response = HTTParty.get("http://dw.notonthehighstreet.com/trends/partners?timeframe=#{params[:timeframe]}&token=#{TOKEN}")
  response.body.to_json
end

get '/partner/:id' do
  content_type :json
  response = HTTParty.get("http://dw.notonthehighstreet.com/trends/partner/#{params[:id]}?timeframe=#{params[:timeframe]}&token=#{TOKEN}")
  response.body.to_json
end
