class SearchesController < ApplicationController
  protect_from_forgery with: :null_session


  def create
    data = search_params
    return head :ok if data["user_search"].blank?

    @search = Search.new(user_search: data["user_search"])
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
    if request.format.json?
      Json.parse(request.body.read)
    else
      params
    end
  end
end