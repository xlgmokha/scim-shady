RSpec.describe Scim::Shady::User do
  subject { described_class.new }
  let(:user_name) { FFaker::Internet.user_name }

  before do
    subject.user_name = user_name
    subject.name.formatted = "Ms. Barbara J Jensen, III"
    subject.name.family_name = "Jensen"
    subject.name.given_name = "Barbara"
    subject.name.middle_name = "Jane"
    subject.name.honorific_prefix = "Ms."
    subject.name.honorific_suffix = "III"
    subject.display_name = "Barbara Jensen"
  end

  specify { expect(subject.to_h[:userName]).to eql(user_name) }
  specify { expect(subject).to be_valid }
  specify { subject.valid?; puts subject.errors.full_messages.inspect }
end
