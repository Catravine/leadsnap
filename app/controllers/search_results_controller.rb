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
    authorize @results
  end

  private

  def phone_parse(phone)
    if phone.length > 5
      "(" << phone[0..2] << ") " << phone[3..5] << "-" << phone[6..9]
    else
      phone
    end
  end

end
