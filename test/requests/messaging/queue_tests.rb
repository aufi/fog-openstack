require "test_helper"

describe "Fog::Openstack::Messaging::Queue | Messaging queue requests" do
  before do
    @queue_format = {}
    @queues = Fog::Openstack::Messaging::Queue.list_queues.body
    @plan_format = {
        "created_at"  => Fog::Nullable::String,
        "description" => Fog::Nullable::String,
        "name"        => String,
        "parameters"  => Fog::Nullable::Array,
        "roles"       => Fog::Nullable::Array,
        "updated_at"  => Fog::Nullable::String,
        "uuid"        => String,
        "version"     => Fog::Nullable::Integer
    }
  end

  describe "success" do
    # TODO
    xit "#list_queues" do
      @queues.must_match_schema([@queue_format])
    end

    xit "#get_queue" do
      Fog::Openstack::Messaging::Queue().body.must_match_schema(@plan_format)
    end
  end
end
