class InformationBlock < ApplicationRecord
  belongs_to :composite, polymorphic: true
end
