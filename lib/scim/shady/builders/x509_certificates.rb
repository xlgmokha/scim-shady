module Scim
  module Shady
    module Builders
      class X509Certificates
        def add(certificate)
          @items ||= []
          @items.push(value: certificate.to_pem.gsub(/-----BEGIN CERTIFICATE-----/, '').gsub(/-----END CERTIFICATE-----/, ''))
        end

        def to_h
          { 'x509Certificates' => @items }
        end
      end
    end
  end
end
