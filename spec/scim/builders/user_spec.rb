RSpec.describe Scim::Shady::Builders::User do
  subject { described_class.new }

  describe ".build" do
    let(:id) { SecureRandom.uuid }
    let(:created_at) { Time.now }
    let(:updated_at) { Time.now }
    let(:user_url) { FFaker::Internet.uri("https") }
    let(:user_version) { SecureRandom.uuid }
    let(:username) { FFaker::Internet.user_name }

    it 'builds a minimal scim user' do
      subject.id = id
      subject.username = username
      subject.created_at = created_at
      subject.updated_at = updated_at
      subject.location = user_url
      subject.version = user_version
      result = subject.build

      expect(result.id).to eql(id)
      expect(result.username).to eql(username)
      expect(result.created).to eql(DateTime.parse(created_at.utc.iso8601))
      expect(result.last_modified).to eql(DateTime.parse(updated_at.utc.iso8601))
      expect(result.version).to eql(user_version)
      expect(result.location).to eql(user_url)
    end
  end
end
