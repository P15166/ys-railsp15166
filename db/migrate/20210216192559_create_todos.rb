class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
        t.string :name, null: false
        t.text :description, null: false
        t.belongs_to :user, null: false, foreign_key: true

        t.timestamps null: false
    end

    add_index :todos, [:user_id, :name]
  end
end
