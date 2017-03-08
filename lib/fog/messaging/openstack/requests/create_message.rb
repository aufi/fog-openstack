module Fog
  module Messaging
    class OpenStack
      class Real
        def create_message(queue_name, messages)
          data = {
            'messages' => messages
          }

          request(
              :body    => Fog::JSON.encode(data),
              :expects => [201],
              :method  => 'POST',
              :path    => "queues/#{queue_name}/messages"
          )
        end
      end

      class Mock
        def get_message(_id)
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
