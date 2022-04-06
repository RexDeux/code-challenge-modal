require 'rails_helper'

RSpec.describe Invite, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  cycle = Cycle.create(
    { name: 'Inkjet printer', public_status: true },
  )

  it "may contain no message" do
    invite = Invite.new(email: "test123@email123.com")
    invite.cycle = cycle
    expect(invite).to be_valid
  end
  it "is not valid without an email" do
    invite = Invite.new(email: nil)
    expect(invite).to_not be_valid
  end

  it "is not valid if email is of the wrong format" do
    invite = Invite.new(email: "randomrandomizerandonimity")
    expect(invite).to_not be_valid
  end
  it "should return a name from the email provided" do
    invite = Invite.new(email: "john.cena@wwe.com")
    invite.cycle = cycle
    invite.save
    expect(invite.name).to eq("John Cena")
  end
end
