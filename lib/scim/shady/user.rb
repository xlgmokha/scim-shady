module Scim
  module Shady
    class User < Resource
      attr_accessor :username

      def to_h
        super.merge({
          'schemas' => [Schemas::USER],
          'userName' => username,
        })
      end

      class << self
        def build
          resource = new
          yield resource
          resource.to_h
        end

        def build_json
          hash = build do |resource|
            yield resource
          end
          JSON.dump(hash)
        end
      end
    end
  end
end
