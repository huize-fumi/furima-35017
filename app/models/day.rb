class Day < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :period
end
