require 'fog/openstack/models/collection'
require 'fog/messaging/openstack/models/queue'

module Fog
  module Messaging
    class OpenStack
      class Queues < Fog::OpenStack::Collection
        model Fog::Messaging::OpenStack::Queue

        def all(q = [])
          load_response(service.list_queues(q), "queues")
        end

        def find_by_id(id)
          queue = service.get_queue(id).body
          new(queue)
        rescue Fog::Messaging::OpenStack::NotFound
          nil
        end
      end
    end
  end
end
