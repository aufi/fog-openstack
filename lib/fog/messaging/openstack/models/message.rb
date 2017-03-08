require 'fog/openstack/models/model'

module Fog
  module Messaging
    class OpenStack
      class Message < Fog::OpenStack::Model
        identity :id

        attribute :age
        attribute :body
        attribute :href
        attribute :ttl
      end
    end
  end
end
