class Project < ActiveRecord::Base
  def self.sel_projects
    self.all.map{ |ele| [ele.name, ele.id]}
  end
  def lot
    Time.now.strftime('%y%m%d_%H%M') + self.abbr
  end
  def to_s_svg(orders)
    'hoge'
  end
end
