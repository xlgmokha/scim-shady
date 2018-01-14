module Scim
  module Shady
    module Builders
      class User < Resource
        attr_accessor :username

        def build
          Scim::Shady::User.new(to_json)
        end

        def to_json
          JSON.generate(to_h)
        end

        def to_h
          super.merge({
            'schemas' => [Schemas::USER],
            'userName' => username,
          })
        end
      end
    end
  end
end
