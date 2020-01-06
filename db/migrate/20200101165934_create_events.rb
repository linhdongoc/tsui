class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :location
      t.string :categories
      t.datetime :term_start
      t.datetime :term_end

      t.timestamps
    end
  end
end
