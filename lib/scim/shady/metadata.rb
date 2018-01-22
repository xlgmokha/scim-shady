module Scim
  module Shady
    class Metadata
      def initialize(hash)
        @hash = hash
      end

      def created
        created_at
      end

      def created_at
        DateTime.parse(to_h['meta']['created'])
      end

      def last_modified
        updated_at
      end

      def updated_at
        DateTime.parse(to_h['meta']['lastModified'])
      end

      def version
        to_h['meta']['version']
      end

      def location
        to_h['meta']['location']
      end

      def resource_type
        to_h['meta']['resourceType']
      end

      def user?
        resource_type == 'User'
      end

      def to_h
        @hash
      end
    end
  end
end
