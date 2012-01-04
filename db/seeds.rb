# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Font.create({ :font_family => 'Garamond', :font_size => 12, 
              :heart_font_family => 'Garamond', :heart_font_size => 12,
              :star_font_family => 'Garamond', :star_font_size => 12,
              :cross_font_family => 'Garamond', :cross_font_size => 12
            })

Fontset.create({ :name => 'a',
                 :l1 => 1,
                 :l2 => 1,
                 :l3 => 1
               })
Fontset.create({ :name => 'b',
                 :l1 => 1,
                 :l2 => 1,
                 :l3 => 1
               })
Fontset.create({ :name => 'c',
                 :l1 => 1,
                 :l2 => 1,
                 :l3 => 1
               })
Fontset.create({ :name => 'd',
                 :l1 => 1,
                 :l2 => 1,
                 :l3 => 1
               })

Order.create({ :l1 => 'Yuta#Lina',
               :l2 => '2011/12/29',
               :l3 => '\(^o^)/',
               :fontset_id => 1,
               :project_id => 1,
               :done => 0
             })
Project.create({ :name => 'ニコロポーロ',
                 :abbr => 'NP',
                 :num => 35,
                 :template => ''
               })
