class Campaign < ActiveRecord::Base
  has_many :leads
end
