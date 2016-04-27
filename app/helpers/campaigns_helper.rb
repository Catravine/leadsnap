module CampaignsHelper

  def all_leads(campaign)
    Lead.where(campaign_id: campaign)
  end

  def amt_leads(*args)
    case args.length
    when 1
      # return amount of leads in a whole campaign
      return all_leads(args.first).count
    when 2
      # return amount of leads in a campaign with given source code
      return Lead.where(campaign_id: args.first, source_code: args[1]).count
    else
      raise ArgumentError, "Too many arguments"
    end
  end

  def sources(campaign)
    Lead.where(campaign_id: campaign.id).uniq.pluck(:source_code)
  end

  def lead_breakdown(campaign)
    list_items = String.new
    sources =
    Lead.where(campaign_id: campaign.id).uniq.pluck(:source_code)
    sources.each do |code|
      lead_count = Lead.where(campaign_id: campaign.id, source_code: code).count
      list_items << "<li>#{code}: #{lead_count}</li>"
    end
    list_items.html_safe
  end

end
