# -*- coding: utf-8 -*-
class Font < ActiveRecord::Base
  def self.sel_fonts
    self.all.map{ |ele| [ele.to_s, ele.id]}
  end

  def to_s
    base = "#{self.font_family}:#{self.font_size}"
    heart = "[♡]#{self.heart_font_family}:#{self.heart_font_size}"
    star = "[☆]#{self.star_font_family}:#{self.star_font_size}"
    cross = "[+]#{self.cross_font_family}:#{self.cross_font_size}"
    [base,heart,star,cross].join('/')
  end
end
