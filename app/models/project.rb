# -*- coding: utf-8 -*-
class Project < ActiveRecord::Base
  has_many :orders
  
  def self.sel_projects
    self.all.map{ |ele| [ele.name, ele.id]}
  end
  def lot
    Time.now.strftime('%y%m%d_%H%M') + self.abbr
  end
=begin
  def str2tag(str, font)
    #heart
    str = str.gsub(/%/, "<tspan font-family='#{font.heart_font_family}' font-size='#{font.heart_font_size}'>♡</tspan>")
    #cross
    str = str.gsub(/\+/, "<tspan font-family='#{font.cross_font_family}' font-size='#{font.cross_font_size}'>+</tspan>")
    #star
    str = str.gsub(/\*/, "<tspan font-family='#{font.star_font_family}' font-size='#{font.star_font_size}'>★</tspan>")
    #base
    str = "<tspan font-family='#{font.font_family}' font-size='#{font.font_size}'>#{str}</tspan>"
    return str
  end
=end
  def to_s_svg(orders)
    source = self.template
    doc = TemplateMaker.new source
    orders.each do |order|
      doc.insertOrder(order)
    end
    return doc.to_s
  end
  def self.test
    a = self.find(1)
    orders = Order.where('project_id = 1')
    a.to_s_svg(orders)
  end
end
class TemplateMaker
  require "rexml/document"
  require "rexml/xpath"
  def initialize(source)
    @doc = REXML::Document.new source
    @keys = [['Line1','l1'], ['Line2', 'l2'], ['Line3', 'l3']]
  end
  #ビジネスロジック依存箇所
  def insertOrder(order)
    @keys.each do |pair|
      REXML::XPath.each(@doc, '//text') do |ele|
        if(ele.text == pair[0])
          ele.text = ''
          str = instance_eval("order.#{pair[1]}")

          font = instance_eval("order.fontset.#{pair[1]}font")
          maketag(ele, str, font)
          break
        end
      end
    end
  end
  def maketag(ele, str, font)
    while(str =~ /(.*?)([%\+\*])(.*)/)
      ele.add_element('tspan', {'font-family' => "'#{font.font_family}'", 'font-size' => "'#{font.font_size}'" }).add_text($1)
      char = []
      case $2
      when '%'
        char = ['♡', font.heart_font_family, font.heart_font_size]
      when '+'
        char = ['+', font.cross_font_family, font.cross_font_size]
      when '*'
        char = ['★', font.star_font_family, font.star_font_size]
      else
        char = [$2, font.font_family, font.font_size]
      end

      ele.add_element('tspan', {'font-family' => "'#{char[1]}'", 'font-size' => "'#{char[2]}'" }).add_text(char[0])

      str = $3
    end

    if(!str.empty?)
      ele.add_element('tspan', {'font-family' => "'#{font.font_family}'", 'font-size' => "'#{font.font_size}'" }).add_text(str)
    end
  end

  def to_s
    #残っている文言を削除
    @keys.each do |pair|
      REXML::XPath.each(@doc, '//text') do |ele|
        if(ele.text == pair[0])
          ele.text = ''
        end
      end
    end

    @doc.to_s
  end
end
