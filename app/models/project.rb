class Project < ActiveRecord::Base
  def self.sel_projects
    self.all.map{ |ele| [ele.name, ele.id]}
  end
end
