module Scim
  module Shady
    module Builders
      class PhoneNumbers
        def add(phone_number, type: :work)
          @items ||= []
          @items.push(value: phone_number, type: type)
        end

        def to_h
          { 'phoneNumbers' => @items }
        end
      end
    end
  end
end
