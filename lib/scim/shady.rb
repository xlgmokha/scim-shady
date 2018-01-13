require "time"
require "scim/shady/version"

module Scim
  module Shady
    class User
      attr_accessor :id
      attr_accessor :username
      attr_accessor :created_at
      attr_accessor :updated_at
      attr_accessor :location
      attr_accessor :version

      def to_h
        {
          'schemas' => [Schemas::USER],
          'id' => id,
          'userName' => username,
          'meta' => {
            'resourceType' => 'User',
            'created' => created_at.utc.iso8601,
            'lastModified' => updated_at.utc.iso8601,
            'location' => location,
            'version' => version,
          },
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
