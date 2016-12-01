class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.references :author, foreign_key: true
      t.string :title
      t.date :release_year

      t.timestamps
    end
  end
end
