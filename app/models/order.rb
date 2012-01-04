class Order < ActiveRecord::Base
  belongs_to :fontset
  belongs_to :project
  def self.done(orders, lot)
    orders.each do |order|
      order.done = true
      order.lot = lot
      order.save
    end
  end
end
