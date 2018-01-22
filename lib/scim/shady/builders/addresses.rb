module Scim
  module Shady
    module Builders
      class Addresses
        def add(type:, street_address:, locality:, region:, postal_code:, country:, primary: false)
          @items ||= []
          @items.push(
            type: type,
            streetAddress: street_address,
            locality: locality,
            region: region,
            postalCode: postal_code,
            country: country,
            primary: primary,
          )
        end

        def to_h
          { 'addresses' => @items }
        end
      end
    end
  end
end
