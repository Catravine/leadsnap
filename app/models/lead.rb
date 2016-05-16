class Lead < ActiveRecord::Base

  include PgSearch

  belongs_to :campaign
  has_one :recall, dependent: :destroy

  default_scope { order("leads.last_dialed ASC") }

  delegate :name, to: :campaign, prefix: true
  delegate :notes, to: :campaign, prefix: true
  delegate :code, to: :campaign, prefix: true
  delegate :callback_phone, to: :campaign, prefix: true

  pg_search_scope :search_name, :against => [:name1, :name2]
  pg_search_scope :search_phone, :against => [:phone1, :phone2, :phone3]

  def self.assign_from_row(row)
    lead = Lead.where(account: row[:account]).first_or_initialize
    lead.assign_attributes row.to_hash.slice(:name1, :name2,
      :address1, :address2, :city, :state, :zip, :phone1, :phone2,
      :phone3, :source_code)
    lead
  end

  def self.import(file)
    counter = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      lead = Lead.assign_from_row(row)
      if lead.save
        counter += 1
      else
        puts "#{lead.account} - #{lead.errors.full_messages.join(",")}" if lead.errors.any?
      end
    end
    counter
  end

  def dial_lead
    self.dial_count += 1 unless Recall.find_by(lead: self)
    update(last_dialed: Time.now)
  end

  def disconnect_check
    if [phone1, phone2, phone3].all? { |phone| phone == nil || phone[0] == 'd' }
      update(disconnected: true)
    else
      update(dial_count: dial_count - 1)
    end
  end

end
