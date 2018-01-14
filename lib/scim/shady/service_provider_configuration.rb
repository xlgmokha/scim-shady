module Scim
  module Shady
    class ServiceProviderConfiguration
      def initialize(json)
        @json = json
      end

      def documentation_uri
        to_h['documentationUri']
      end

      def to_h
        @hash ||= JSON.parse(to_json)
      end

      def to_json
        @json
      end
    end
  end
end
