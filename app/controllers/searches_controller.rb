class SearchesController < ApplicationController
  protect_from_forgery with: :null_session


  def create
    @search = Search.new(search_params)
    @search.user_ip = request.remote_ip

    if @search.save
      render json: @search, status: :created
    else
      render json: @search.errors, status: :unprocessable_entity
    end
  end


  def index
    ip = params[:ip]
    if ip.present?
      @searches = Search.where(user_ip: ip)
                        .group(:user_search)
                        .order(Arel.sql('COUNT(*) DESC'))
                        .limit(10)
                        .count

    else
      @searches = []
    end
  end

  private

  def search_params
    params.permit(:user_search)
  end
end