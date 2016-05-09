class Lead < ActiveRecord::Base

  include PgSearch

  belongs_to :campaign
  has_one :callback, dependent: :destroy

  default_scope { order("leads.last_dialed ASC") }

  delegate :name, to: :campaign, prefix: true
  delegate :notes, to: :campaign, prefix: true
  delegate :code, to: :campaign, prefix: true
  delegate :callback_phone, to: :campaign, prefix: true

  pg_search_scope :search_name, :against => [:name1, :name2]
  pg_search_scope :search_phone, :against => [:phone1, :phone2, :phone3]

  def dial_lead
    self.dial_count += 1
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
