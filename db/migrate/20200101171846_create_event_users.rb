class CreateEventUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :event_users do |t|
      t.references :event
      t.references :user
      t.string :role
      t.timestamps
    end
  end
end
