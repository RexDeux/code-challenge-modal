class AddNameToInvites < ActiveRecord::Migration[7.0]
  def change
    add_column :invites, :name, :string
  end
end
