require "qarnot/models/base"

module Qarnot
  module Model
    class Disk < Base
      attr_accessor :uuid, :read_only, :description, :file_count, :used_space_bytes, :creation_date, :locked

      def self.attributes_mapping
        {
          uuid:             :uuid,
          readOnly:         :read_only,
          description:      :description,
          fileCount:        :file_count,
          usedSpaceBytes:   :used_space_bytes,
          creationDate:     :creation_date,
          locked:           :locked
        }
      end

      def destroy
        auth.root["disks"][uuid].delete
      end

      def save
        params = {}
        params[:description] = description if description
        params[:locked] = locked if locked

        auth.root["disks"][uuid].put(JSON.generate(params))
      end
    end
  end
end
