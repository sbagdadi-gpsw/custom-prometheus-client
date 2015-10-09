$LOAD_PATH << File.expand_path('../../lib', File.dirname(__FILE__))

require 'rack'
require 'prometheus/client/rack/collector'
require 'prometheus/client/rack/exporter'

options = { service_name:  'my_service'}
use Prometheus::Client::Rack::Collector , options
use Prometheus::Client::Rack::Exporter


run ->(_) { [200, { 'Content-Type' => 'text/html' }, ['OK']] }
# run Rails.application
