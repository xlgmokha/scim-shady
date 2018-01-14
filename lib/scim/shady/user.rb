module Scim
  module Shady
    class User < Resource
      class << self
        def build
          builder do |builder|
            yield builder if block_given?
          end.build
        end

        def builder
          builder = builder_class.new
          yield builder if block_given?
          builder
        end

        def builder_class
          Scim::Shady::Builders::User
        end
      end
    end
  end
end
