module LeadsHelper

    def campaign_name(lead)
      Campaign.find_by(id: lead.campaign_id).name
    end

    def campaign_notes(lead)
      Campaign.find_by(id: lead.campaign_id).notes
    end

    def campaign_code(lead)
      Campaign.find_by(id: lead.campaign_id).code
    end

    def campaign_phone(lead)
      Campaign.find_by(id: lead.campaign_id).callback_phone
    end

end
