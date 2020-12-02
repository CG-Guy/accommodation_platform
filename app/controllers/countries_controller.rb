class CountriesController < ApplicationController
  def province
    
    render json: CS.get(params[:country]).collect {|province| {text: province[1], value: province[1], id: province[0]}}.prepend({:text=>"Please Select...", :id=>"-1", :value=>"-1"})
  end

  def city
    render json: CS.get(params[:country], params[:province]).collect { |city| {text: city, id: city, value: city} }.prepend({:text=>"Please Select...", :id=>"-1", :value=>"-1"})
  end
end
