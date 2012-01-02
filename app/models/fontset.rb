class Fontset < ActiveRecord::Base
  belongs_to :l1, :class_name => "Font", :foreign_key => "l1"
  belongs_to :l2, :class_name => "Font", :foreign_key => "l2"
  belongs_to :l3, :class_name => "Font", :foreign_key => "l3"
  def to_s
    "#{self.name}, L1:#{self.l1.to_s}, L2:#{self.l2.to_s}, L3:#{self.l3.to_s}"
  end
  def self.sel_fontsets
    self.all.map{ |ele| [ele.name, ele.id]}
  end
end
