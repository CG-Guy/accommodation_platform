class MailSetting < ApplicationRecord
  belongs_to :composite, polymorphic: true
end
