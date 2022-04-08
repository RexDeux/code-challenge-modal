require 'rails_helper'

RSpec.describe Cycle, type: :model do
  subject(:cycle) { create(:cycle) }

  it { should validate_presence_of(:name) }
  it { should have_many(:invites) }
end
