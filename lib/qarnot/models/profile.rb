require "qarnot/models/base"

module Qarnot
  module Model
    class Profile < Base
      attr_accessor :name, :constants

      def self.attributes_mapping
        {
          name: :name,
          constants: :constants
        }
      end
    end
  end
end
