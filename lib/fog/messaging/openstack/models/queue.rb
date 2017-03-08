require 'fog/openstack/models/model'

module Fog
  module Messaging
    class OpenStack
      class Queue < Fog::OpenStack::Model
        identity :name

        attribute :href
      end
    end
  end
end
