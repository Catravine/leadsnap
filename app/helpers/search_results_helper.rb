module SearchResultsHelper

  def search_results_title
    @name_query ? "Search for Name: #{@name_query.titleize}" : "Search for Phone: #{@phone_query}"
  end

end
