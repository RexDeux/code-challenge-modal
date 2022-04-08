class CreateInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :invites do |t|
      t.string :email
      t.string :message

      t.timestamps
    end
  end
end
