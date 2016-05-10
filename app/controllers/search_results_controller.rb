class SearchResultsController < ApplicationController

  def index
    @name_query = params[:name_query]
    @phone_query = params[:phone_query]
    if @name_query
      @results = Lead.search_name(@name_query)
    elsif @phone_query
      @adj_phone_query = @phone_query.scan(/\d/).join
      @results = Lead.search_phone(phone_parse(@adj_phone_query))
    end
  end

  private

  def phone_parse(phone)
    "(" << phone[0..2] << ") " << phone[3..5] << "-" << phone[6..9]
  end

end
