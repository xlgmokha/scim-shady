module Scim
  module Shady
    module Builders
      class InstantMessengers
        def add(handle, type:)
          @items ||= []
          @items.push(value: handle, type: type)
        end

        def to_h
          { 'ims' => @items }
        end
      end
    end
  end
end
