class Sliver < ActiveRecord::Base

  validates_format_of :long_url, :with => URI::regexp(%w(http https))

end
