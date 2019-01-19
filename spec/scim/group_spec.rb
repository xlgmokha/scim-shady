RSpec.describe Scim::Shady::Group do
  subject { described_class.new }

  before do
    subject.display_name = 'voltron'
    subject.members << { value: SecureRandom.uuid, '$ref' => FFaker::Internet.uri('https'), type: 'User' }
  end

  specify { expect(subject).to be_valid }
end
