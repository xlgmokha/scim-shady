module Scim
  module Shady
    class Resource
      def initialize(json)
        @json = json
      end

      def meta
        Metadata.new(to_h)
      end

      def id
        to_h['id']
      end

      def to_h
        @json_hash ||= JSON.parse(to_json)
      end

      def to_json
        @json
      end
    end
  end
end
