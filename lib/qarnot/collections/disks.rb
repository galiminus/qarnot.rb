require "qarnot/collections/base"
require "qarnot/models/disk"
require "json"

module Qarnot
  module Collection
    class Disks < Base

      def create(params)
        auth.root["disks"].post(params)
      end

      def all
        JSON.parse(auth.root["disks"].get.body).map do |disk_data|
          Qarnot::Model::Disk.new({ auth: auth }.merge(disk_data))
        end
      end

      def find(uuid)
        disk_data = JSON.parse(auth.root["disks"][uuid].get.body)
        Qarnot::Model::Disk.new({ auth: auth }.merge(disk_data))
      end

    end
  end
end
