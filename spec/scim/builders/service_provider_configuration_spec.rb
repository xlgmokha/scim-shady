RSpec.describe Scim::Shady::Builders::ServiceProviderConfiguration do
  subject { described_class.new }

  describe ".build" do
    let(:documentation_uri) { FFaker::Internet.uri("https") }

    it 'can specify the documentation url' do
      subject.documentation_uri = documentation_uri
      expect(subject.build.documentation_uri).to eql(documentation_uri)
    end
  end
end
