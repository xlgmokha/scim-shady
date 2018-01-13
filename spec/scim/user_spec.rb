RSpec.describe Scim::Shady::User do
  describe ".build" do
    subject { described_class }
    let(:id) { SecureRandom.uuid }
    let(:email) { FFaker::Internet.email }


    it 'builds a scim user' do
      result = subject.build do |builder|
        builder.id = id
        builder.external_id = email
      end.to_h

      expect(result['schemas']).to match_array([Scim::Shady::Schemas::USER])
      expect(result['id']).to eql(id)
      expect(result['externalId']).to eql(email)
    end
  end
end
