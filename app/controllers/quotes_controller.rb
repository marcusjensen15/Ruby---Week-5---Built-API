class QuotesController < ApplicationController


  def index
    @quotes = Quote.all
    json_response(@quotes)
  end

  # name = params[:name]
  # @quotes = Quote.search(name)
  # binding.pry
  # json_response(@quotes)


  def show
    @quote = Quote.find(params[:id])
    json_response(@quote)
  end

  def create
    @quote = Quote.create!(quote_params)
    json_response(@quote, :created)
  end

  def update
    @quote = Quote.find(params[:id])
    @quote.update!(quote_params)
    render status: 200, json: {
      message: "This quote has been updated successfully."
    }

  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def quote_params
    params.permit(:author, :content)
  end
end
