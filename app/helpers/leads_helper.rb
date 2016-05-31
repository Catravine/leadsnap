module LeadsHelper

  def lead_status(lead)
    content_tag(:h3, lead_status_text(lead), class: "#{lead_status_class(lead)}")
  end

  def lead_status_text(lead)
    if recall = Recall.find_by(lead:lead)
      return "#{recall.user.nickname}'s Callback"
    end
    if Sale.find_by(lead: lead)
      sold_by = Sale.find_by(lead: lead).user.nickname
      sold_date = Sale.find_by(lead: lead).date
      return  "#{sold_by} #{sold_date.strftime("%-m/%-d")}"
    end
    if No.find_by(lead: lead)
      no_by = No.find_by(lead: lead).user.nickname
      no_date = No.find_by(lead: lead).date
      return "No on #{no_date.strftime("%-m/%-d")}"
    end
    return "Previous Round 'no'" if lead.round > 0
    return "Killed" if lead.killed?
    return "No Valid Phone Numbers" if lead.disconnected?
    return "Day Lead" if lead.day_lead?
    "Unreached"
  end

  def lead_status_class(lead)
    return "killed" if lead.killed?
    return "day_lead" if lead.day_lead?
    return "no" if No.find_by(lead: lead)
    return "sold" if Sale.find_by(lead: lead)
    "unreached"
  end

  def next_lead_button(lead)
    return "#{lead.recall.user.nickname}'s CBs" if lead.recall
    lead.day_lead? ? "Day Leads" : "#{lead.source_code}"
  end

end
