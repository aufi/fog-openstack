require 'fog/openstack/models/collection'
require 'fog/openstack/metering/models/event'

module Fog
  module OpenStack
    class Metering
      class Events < Fog::OpenStack::Collection
        model Fog::OpenStack::Metering::Event

        def all(q = [])
          load_response(service.list_events(q))
        end

        def find_by_id(message_id)
          event = service.get_event(message_id).body
          new(event)
        rescue Fog::OpenStack::Metering::NotFound
          nil
        end
      end
    end
  end
end
