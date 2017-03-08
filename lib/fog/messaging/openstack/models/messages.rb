require 'fog/openstack/models/collection'
require 'fog/messaging/openstack/models/message'

module Fog
  module Messaging
    class OpenStack
      class Messages < Fog::OpenStack::Collection
        model Fog::Messaging::OpenStack::Message

        def all(queue_name)
          load_response(service.list_messages(queue_name), "messages")
        end

        def find_by_id(id)
          queue = service.get_message(id).body
          new(queue)
        rescue Fog::Messaging::OpenStack::NotFound
          nil
        end
      end
    end
  end
end
