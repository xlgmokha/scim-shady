RSpec.describe Scim::Shady::ServiceProviderConfig do
  describe ".build" do
    subject { described_class }

    it 'builds a configuration' do
      result = subject.build do |builder|
        builder.bulk do |x|
          x.supported = true
          x.max_operations = 1_000
          x.max_payload_size = 1_048_576
        end
      end

      expect(result.bulk_supported).to be(true)
      expect(result.bulk_max_operations).to eql(1_000)
      expect(result.bulk_max_payload_size).to eql(1_048_576)
    end
  end
end
