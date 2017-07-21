require "qarnot/collections/base"

module Qarnot
  module Collection
    class Profiles < Base
      def all
        JSON.parse(auth.root["profiles"].get.body).map do |name|
          find(name)
        end
      end

      def find(name)
        data = JSON.parse(auth.root["profiles"][name].get.body)
        Qarnot::Model::Profile.new({ auth: auth }.merge(data))
      end
    end
  end
end
