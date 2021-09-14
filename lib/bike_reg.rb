# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'bike_reg/version'

module BikeReg
  autoload :Client, 'bike_reg/client'
  autoload :Collection, 'bike_reg/collection'
  autoload :Error, 'bike_reg/error'
  autoload :Object, 'bike_reg/object'
  autoload :Resource, 'bike_reg/resource'

  autoload :EventResource, 'bike_reg/resources/event_resource'

  autoload :Event, 'bike_reg/objects/event'
end
