module TeamboxInvoice
end

engine = Rails::Plugin.new File.expand_path('../..', __FILE__)
engine.instance_variable_set('@name', 'teambox_invoice')

# turbohax
ObjectSpace.each_object(Rails::Plugin::Loader) do |loader|
  loader.engines << engine
end

# enable autoloading
ActiveSupport::Dependencies.load_paths.concat engine.load_paths

# enable preloading of application classes in production
Rails.configuration.eager_load_paths.concat engine.send(:app_paths)
