require 'active_support/core_ext/hash/indifferent_access'

module Qarnot
  module Model
    class Base
      attr_accessor :auth

      def self.attributes_mapping
        {}
      end

      def initialize(params)
        params.symbolize_keys!

        self.class.attributes_mapping.each do |key, value|
          send("#{value}=", params[key]) if params[key]
        end

        @auth = params.delete :auth
      end

      def attributes
        self.class.attributes_mapping.values.reduce({}) do |attributes, key|
          attributes[key] = send(key) if send(key)
        end
      end

      def update_attributes(attributes)
        attributes.each do |key, value|
          send("#{key}=", value) if self.class.attributes_mapping.values.include?(key)
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
