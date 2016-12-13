class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :city
      t.references :user, index: true
      t.references :state, index: true

      t.timestamps
    end
  end
end
