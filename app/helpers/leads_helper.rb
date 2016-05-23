module LeadsHelper

  def lead_status(lead)
    status = "<h3"
    if lead.killed?
      status << " class=\"killed\">Killed"
    elsif Sale.find_by(lead: lead)
      sold_by = Sale.find_by(lead: lead).user.nickname
      sold_date = Sale.find_by(lead: lead).date
      status << " class=\"sold\">SOLD by #{sold_by} #{sold_date.strftime("%-m/%-d")}"
    elsif No.find_by(lead: lead)
      no_by = No.find_by(lead: lead).user.nickname
      no_date = No.find_by(lead: lead).date
      status << " class=\"no\">No on #{no_date.strftime("%-m/%-d")}"
    elsif lead.disconnected?
      status << " class=\"unreached\">No Valid Phone Numbers"
    elsif lead.day_lead?
      status << " class=\"day_lead\">Day Lead"
    elsif lead.round > 0
      status << " class=\"unreached\">Previous 'No'"
    elsif recall = Recall.where(lead: lead).first
      status << " class=\"unreached\">#{recall.user.nickname}'s Callback"
    else
      status << " class=\"unreached\">Unreached"
    end
    status << "</h3>"
    return status.html_safe
  end

  def next_lead_button(lead)
    return "#{lead.recall.user.nickname}'s CBs" if lead.recall
    lead.day_lead? ? "Day Leads" : "#{lead.source_code}"
  end

end
