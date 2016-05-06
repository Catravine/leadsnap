module LeadsHelper

  def lead_status(lead)
    status = "<h3"
    if lead.killed?
      status << " class=\"killed\">Killed"
    elsif lead.disconnected?
      status << " class=\"unreached\">No Valid Phone Numbers"
    elsif lead.day_lead?
      status << " class=\"day_lead\">Day Lead"
    else
      status << " class=\"unreached\">Unreached"
    end
    status << "</h3>"
    return status.html_safe
  end

end
