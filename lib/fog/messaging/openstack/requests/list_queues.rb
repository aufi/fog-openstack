module Fog
  module Messaging
    class OpenStack
      class Real
        def list_queues(options = []) # limit and marker (last read id)
          data = {
            'q' => []
          }

          options.each do |opt|
            filter = {}

            ['field', 'op', 'value'].each do |key|
              filter[key] = opt[key] if opt[key]
            end

            data['q'] << filter unless filter.empty?
          end

          request(
            :body    => Fog::JSON.encode(data),
            :expects => 200,
            :method  => 'GET',
            :path    => 'queues'
          )
        end
      end

      class Mock
        def list_queues(_options = {})
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
