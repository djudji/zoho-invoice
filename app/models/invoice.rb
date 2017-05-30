class Invoice < ApplicationRecord
  has_many :items, inverse_of: :invoice, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true 

  def build_items(description="Enter item name/description",quantity=1,rate=0,amount=0)
      self.items.build(description: description, quantity: quantity, rate: rate, amount: amount)
  end

end
