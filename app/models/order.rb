class Order < ActiveRecord::Base
  belongs_to :fontset
  belongs_to :project
end
