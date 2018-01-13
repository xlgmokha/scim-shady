require "time"
require "scim/shady/version"

module Scim
  module Shady
    class User
      attr_accessor :id
      attr_accessor :external_id
      attr_accessor :created_at
      attr_accessor :updated_at
      attr_accessor :location
      attr_accessor :version
      attr_accessor :username

      def initialize
        @emails = []
      end

      def add_email(email)
        @emails << email
      end

      def to_h
        {
          'schemas' => [Schemas::USER],
          'id' => id,
          'externalId' => external_id,
          'meta' => {
            'resourceType' => 'User',
            'created' => created_at.utc.iso8601,
            'lastModified' => updated_at.utc.iso8601,
            'location' => location,
            'version' => version,
          },
          'name' => {
          },
          'userName' => username,
          'phoneNumbers' => [],
          'emails' => @emails.each_with_index.map do |x, i|
            { 'value' => x, 'type' => 'work', 'primary' => i == 0 }
          end
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
