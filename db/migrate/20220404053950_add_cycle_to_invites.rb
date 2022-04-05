class AddCycleToInvites < ActiveRecord::Migration[7.0]
  def change
    add_reference :invites, :cycle, null: false, foreign_key: true
  end
end
