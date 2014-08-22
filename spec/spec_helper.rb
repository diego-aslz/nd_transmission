require File.expand_path('../../lib/nd_transmission', __FILE__)

RSpec.configure do |config|
  config.order = "random"
  config.before(:each) { GC.disable }
  config.after(:each)  { GC.enable }
end
