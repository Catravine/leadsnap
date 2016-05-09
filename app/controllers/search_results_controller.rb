class SearchResultsController < ApplicationController

  def index
    @name_query = params[:name_query]
    @phone_query = params[:phone_query]
    if @name_query
      @results = Lead.search_name(@name_query)
    elsif @phone_query
      @results = Lead.search_phone(@phone_query)
    end
  end

end
