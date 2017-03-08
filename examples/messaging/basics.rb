require 'fog/openstack'

auth_url = "http://192.168.24.1:5000/v2.0/tokens"
username = 'admin'
password = '1b90328f9756ae50c36b7246df832b57a0cf2c8e'

@connection_params = {
    :openstack_auth_url     => auth_url,
    :openstack_username     => username,
    :openstack_api_key      => password,
}

puts "### SERVICE CONNECTION ###"

messaging_service = Fog::Messaging::OpenStack.new(@connection_params)

p messaging_service

puts "### LIST QUEUES ###"

p messaging_service.list_queues.body

queues = messaging_service.queues.all

p queues

# puts "### GET QUEUE ###" ..not needed - no usable attributes are provided in queue show
#
# p messaging_service.get_queue(queues.first.name).body
#
# p messaging_service.queues.find_by_id(queues.first.name)

puts "### LIST MESSAGES ###"

p messaging_service.list_messages(queues.first.name).body

p messaging_service.messages.all(queues.first.name)

puts "### CREATE MESSAGE ###"

msgs = [{
    "ttl"  => 600,
    "body" => {
        "event" => "fooevent.start",
        "bar"   => "baz"
    }
        },{
    "body" => {
        "event" => "fooevent.stop",
    }
}]

p messaging_service.create_message(queues.first.name, msgs)

p messaging_service.create_message("foo_queue", msgs)
