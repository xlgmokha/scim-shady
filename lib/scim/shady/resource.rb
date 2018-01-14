module Scim
  module Shady
    class Resource
      def initialize(json)
        @json = json
      end

      def id
        to_h['id']
      end

      def created
        DateTime.parse(to_h['meta']['created'])
      end

      def last_modified
        DateTime.parse(to_h['meta']['lastModified'])
      end

      def version
        to_h['meta']['version']
      end

      def location
        to_h['meta']['location']
      end

      def to_h
        JSON.parse(to_json)
      end

      def to_json
        @json
      end

    end
  end
end
