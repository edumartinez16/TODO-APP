class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :status
      t.string :description
      t.date :limit
      t.integer :list_id

      t.timestamps
    end
  end
end
