RSpec.describe Scim::Shady::User do
  subject { described_class.new }
  let(:user_name) { FFaker::Internet.user_name }

  before do
    subject.user_name = user_name
  end

  specify { expect(subject.to_h[:userName]).to eql(user_name) }
end
