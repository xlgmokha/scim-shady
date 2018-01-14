module Scim
  module Shady
    module Builders
      class ServiceProviderConfiguration
        attr_accessor :documentation_uri
        attr_accessor :patch

        def bulk
          @bulk = Bulk.new
          yield @bulk
        end

        def filter
          @filter = Filter.new
          yield @filter
        end

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
            'patch' => { "supported" => patch },
            'bulk' => @bulk.to_h,
            'filter' => @filter.to_h,
          }
        end

        class Bulk
          attr_accessor :supported
          attr_accessor :max_operations
          attr_accessor :max_payload_size

          def to_h
            {
              'supported' => supported,
              'maxOperations' => max_operations,
              'maxPayloadSize' => max_payload_size,
            }
          end
        end

        class Filter
          attr_accessor :supported
          attr_accessor :max_results

          def to_h
            {
              'supported' => supported,
              'maxResults' => max_results,
            }
          end
        end
      end
    end
  end
end
