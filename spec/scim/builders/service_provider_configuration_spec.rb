RSpec.describe Scim::Shady::Builders::ServiceProviderConfiguration do
  subject { described_class.new }

  describe ".build" do
    let(:documentation_uri) { FFaker::Internet.uri("https") }

    it 'can specify the documentation url' do
      subject.documentation_uri = documentation_uri
      expect(subject.build.documentation_uri).to eql(documentation_uri)
    end

    it 'can specitify patch support' do
      subject.patch = false
      expect(subject.build.patch).to be(false)

      subject.patch = true
      expect(subject.build.patch).to be(true)
    end

    it 'can configure bulk support' do
      subject.bulk do |x|
        x.supported = true
        x.max_operations = 1_000
        x.max_payload_size = 1_048_576
      end

      result = subject.build
      expect(result.bulk_supported).to be(true)
      expect(result.bulk_max_operations).to eql(1_000)
      expect(result.bulk_max_payload_size).to eql(1_048_576)
    end
  end
end