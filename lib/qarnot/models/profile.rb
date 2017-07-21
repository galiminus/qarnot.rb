require "qarnot/models/base"

module Qarnot
  module Model
    class Profile < Base
      attr_accessor :name, :constants

      def initialize(params)
        super params

        update_attributes({
          name:             params.delete(:name),
          constants:        params.delete(:constants)
        })
      end
    end
  end
end
