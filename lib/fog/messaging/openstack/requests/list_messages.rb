module Fog
  module Messaging
    class OpenStack
      class Real
        def list_messages(queue_name) # limit and marker (last read id)

          request(
              :expects => 200,
              :method  => 'GET',
              :path    => "queues/#{queue_name}/messages"
          )
        end
      end

      class Mock
        def list_messages(_options = {})
          response = Excon::Response.new
          response.status = 200
          response.body = [{
                               '#TODO event_type' => 'compute.instance.create',
                               'message_id' => 'd646b40dea6347dfb8caee2da1484c56',
                           }]
          response
        end
      end
    end
  end
end
