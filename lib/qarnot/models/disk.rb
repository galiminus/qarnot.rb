require "qarnot/models/base"

module Qarnot
  module Model
    class Disk < Base
      attr_accessor :uuid, :read_only, :description, :file_count, :used_space_bytes, :creation_date, :locked

      def initialize(params)
        super params

        update_attributes({
          uuid:             params.delete(:uuid),
          read_only:        params.delete(:readOnly),
          description:      params.delete(:description),
          file_count:       params.delete(:fileCount),
          used_space_bytes: params.delete(:usedSpaceBytes),
          creation_date:    params.delete(:creationDate),
          locked:           params.delete(:locked)
        })
      end

      def destroy
        auth.root["disks"][uuid].delete
      end

      def save
        auth.root["disks"][uuid].put({
          description: description,
          locked: locked
        })
      end
    end
  end
end
