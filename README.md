# Custom Prometheus Ruby Client

This repo is essentially a fork of https://github.com/prometheus/client_ruby and adds the following behaviour to the captured metrics.

- It takes the service_name as an options to the rake middleware (see usage)
- It adds the following labels to the metrics 
	* User Agent
	* Accept
	* Content Type

## Usage
Add the following to your Gemfile
```
gem 'custom-prometheus-client'
```

Then in your config.ru add the following (Change 'my_app' to the name of your app being monitored)
```
require 'prometheus/client/rack/collector'
require 'prometheus/client/rack/exporter'

options = { service_name:  'my_app'}
use Prometheus::Client::Rack::Collector, options
use Prometheus::Client::Rack::Exporter
```

Configure your prometheus.yml to scrape /metrics from  rails service