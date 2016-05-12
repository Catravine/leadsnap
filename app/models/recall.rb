class Recall < ActiveRecord::Base

  belongs_to :user
  belongs_to :lead

  delegate :nickname, to: :user, prefix: true
  delegate :campaign_id, to: :lead, prefix: true
  delegate :campaign, to: :lead, prefix: true
  delegate :source_code, to: :lead, prefix: true
  delegate :name1, to: :lead, prefix: true
  delegate :name2, to: :lead, prefix: true
  delegate :phone1, to: :lead, prefix: true
  delegate :phone2, to: :lead, prefix: true
  delegate :phone3, to: :lead, prefix: true

end
