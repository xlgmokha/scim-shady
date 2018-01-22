module Scim
  module Shady
    module Builders
      class Emails
        def add(email, type:, primary: false)
          @items ||= []
          @items.push(value: email, type: type, primary: primary)
        end

        def to_h
          { 'emails' => @items }
        end
      end
    end
  end
end
