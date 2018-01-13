module Scim
  module Shady
    class User < Resource
      attr_accessor :username

      def to_h
        super.merge({
          'schemas' => [Schemas::USER],
          'userName' => username,
        })
      end

      class << self
        def build
          user = new
          yield user
          user.to_h
        end
      end
    end
  end
end
