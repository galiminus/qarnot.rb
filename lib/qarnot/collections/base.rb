module Qarnot
  module Collection
    class Base
      attr_accessor :auth

      def initialize(params)
        @auth = params.delete(:auth)
      end
    end
  end
end
