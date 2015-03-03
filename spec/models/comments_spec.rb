require 'spec_helper'

describe Comment do
  subject { described_class.make! }
  it { should be_valid }
  it { should validate_presence_of :body }
  it { should belong_to :article }
end
