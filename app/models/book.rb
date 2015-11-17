class Book < ActiveRecord::Base
  has_many :reviews
  belongs_to :publish

  #バリデーション
  validates :isbn, presence: true, uniqueness: true
  validates :title, length: {minimun:1, maximum: 100}
  validates :price, numericality: {only_integer: true}

  def country
    str = self.isbn
    if str[3,1] == "4"
      return "日本"
    end
  end

end
