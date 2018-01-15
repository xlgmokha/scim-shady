module Scim
  module Shady
    class Resource
      include Metadata

      def initialize(json)
        @json = json
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
