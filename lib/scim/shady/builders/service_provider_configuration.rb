module Scim
  module Shady
    module Builders
      class ServiceProviderConfiguration
        attr_accessor :documentation_uri

        def build
          Scim::Shady::ServiceProviderConfiguration.new(to_json)
        end

        def to_json
          JSON.generate(to_h)
        end

        def to_h
          {
            'schemas' => [Schemas::SERVICE_PROVIDER_CONFIG],
            'documentationUri' => documentation_uri,
          }
        end
      end
    end
  end
end
