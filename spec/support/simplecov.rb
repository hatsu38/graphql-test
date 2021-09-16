require 'simplecov'

SimpleCov.start :rails do
  add_filter 'app/channels/' # NOTE: 現在利用していないため
  add_filter 'lib/templates/active_record/model/model.rb'
end
