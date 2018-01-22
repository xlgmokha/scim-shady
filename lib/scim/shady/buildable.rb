module Scim
  module Shady
    module Buildable
      extend ActiveSupport::Concern

      class_methods do
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
      end
    end
  end
end
