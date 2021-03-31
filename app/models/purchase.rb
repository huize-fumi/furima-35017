class Purchase < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token

  validates :token, presence: true
  belongs_to :user
  belongs_to :item
  has_one :sendeing

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end