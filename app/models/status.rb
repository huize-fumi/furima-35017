class Status < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
end
