class Report < ActiveRecord::Base
  belongs_to :report
  belongs_to :datasource
  
  attr_accessible :config, :filters, :description, :datasource_id, :title, :report_type, :user_id, :cache_time
  
  serialize :config, Hash
  serialize :filters
  serialize :sharing_config
  
  validates_presence_of :title, :datasource_id, :report_type, :user_id, :config
  
  #Enable Sharing
  def enable_sharing(password)
    self.sharing_config = {:password => password}
    self.sharing_enabled = true
    self.save
  end
  
  #Disable sharing
  def disable_sharing
    self.sharing_enabled = false
    self.sharing_config = {}
    self.save
  end  
end

