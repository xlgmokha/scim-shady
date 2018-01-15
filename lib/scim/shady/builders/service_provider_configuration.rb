module Scim
  module Shady
    module Builders
      class ServiceProviderConfiguration
        include Metadata
        attr_accessor :documentation_uri
        attr_accessor :patch
        attr_accessor :change_password_supported
        attr_accessor :sort_supported
        attr_accessor :etag_supported

        def initialize
          @authentication_schemes = []
          @created_at = @updated_at = Time.now
        end

        def bulk
          @bulk = Bulk.new
          yield @bulk
        end

        def filter
          @filter = Filter.new
          yield @filter
        end

        def add_authentication_scheme(type)
          if :oauth_bearer_token == type
            @authentication_schemes.push({
              "name" => "OAuth Bearer Token",
              "description" => "Authentication scheme using the OAuth Bearer Token Standard",
              "specUri" => "http://www.rfc-editor.org/info/rfc6750",
              "documentationUri" => "http://example.com/help/oauth.html",
              "type" => "oauthbearertoken",
            })
          elsif :http_basic == type
            @authentication_schemes.push({
              "name" => "HTTP Basic",
              "description" => "Authentication scheme using the HTTP Basic Standard",
              "specUri" => "http://www.rfc-editor.org/info/rfc2617",
              "documentationUri" => "http://example.com/help/httpBasic.html",
              "type" => "httpbasic",
            })
          end
        end

        def build
          Scim::Shady::ServiceProviderConfiguration.new(to_json)
        end

        def to_json
          JSON.generate(to_h)
        end

        def to_h
          super.merge({
            'schemas' => [Schemas::SERVICE_PROVIDER_CONFIG],
            'documentationUri' => documentation_uri,
            'patch' => { "supported" => patch },
            'bulk' => @bulk.to_h,
            'filter' => @filter.to_h,
            'changePassword' => {
              'supported' => change_password_supported,
            },
            'sort' => {
              'supported' => sort_supported,
            },
            'etag' => {
              'supported' => etag_supported,
            },
            'authenticationSchemes' => @authentication_schemes.each_with_index.map do |scheme, index|
              scheme['primary'] = true if index.zero?
              scheme
            end
          })
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
