module Fog
  module Messaging
    class OpenStack
      class Real
        def get_queue(id)
          request(
            :expects => 200,
            :method  => 'GET',
            :path    => "queues/#{id}"
          )
        end
      end

      class Mock
        def get_queue(_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            '#TODO event_type' => 'compute.instance.create',
            'message_id' => 'd646b40dea6347dfb8caee2da1484c56',
          }
          response
        end
      end
    end
  end
end
