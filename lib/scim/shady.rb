require "scim/shady/version"

module Scim
  module Shady
    class User
      attr_accessor :id
      attr_accessor :external_id

      def to_h
        {
          'schemas' => [Schemas::USER],
          'id' => id,
          'externalId' => external_id,
        }
      end

      class << self
        def build
          user = new
          yield user
          user
        end
      end
    end

    class Schemas
      USER = "urn:ietf:params:scim:schemas:core:2.0:User"
    end
  end
end
