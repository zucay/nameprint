class Fontset < ActiveRecord::Base
  belongs_to :l1font, :class_name => "Font", :foreign_key => "l1"
  belongs_to :l2font, :class_name => "Font", :foreign_key => "l2"
  belongs_to :l3font, :class_name => "Font", :foreign_key => "l3"
  def to_s
    "#{self.name}, L1:#{self.l1font.to_s}, L2:#{self.l2font.to_s}, L3:#{self.l3font.to_s}"
  end
  def self.sel_fontsets
    self.all.map{ |ele| [ele.name, ele.id]}
  end
end
