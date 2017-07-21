require 'active_support/core_ext/hash/indifferent_access'

module Qarnot
  module Model
    class Base
      attr_accessor :auth, :uuid

      def initialize(params)
        params.symbolize_keys!

        @auth = params.delete :auth
      end

      def update_attributes(attributes)
        attributes.each do |key, value|
          send("#{key}=", value)
        end
      end

      def update(attributes)
        update_attributes attributes
        save
      end

      def save
        raise NotImplementedError
      end
    end
  end
end
