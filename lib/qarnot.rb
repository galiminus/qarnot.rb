require "qarnot/models/disk"
require "qarnot/models/file"
require "qarnot/models/profile"
require "qarnot/models/task"
require "qarnot/models/user"

require "qarnot/collections/disks"
require "qarnot/collections/files"
require "qarnot/collections/profiles"
require "qarnot/collections/tasks"

require "rest-client"

module Qarnot
  class Auth
    attr_accessor :api_token

    def initialize(params)
      @api_token = params.delete :api_token
    end

    def root
      RestClient::Resource.new("https://api.qarnot.com/", headers: { authorization: api_token })
    end

    def disks
      @disks ||= Qarnot::Collection::Disks.new(auth: self)
    end

    def files
      @files ||= Qarnot::Collection::Files.new(auth: self)
    end

    def profiles
      @profiles ||= Qarnot::Collection::Profiles.new(auth: self)
    end

    def tasks
      @tasks ||= Qarnot::Collection::Tasks.new(auth: self)
    end
  end
end
