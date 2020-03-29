class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :owner
      t.integer :year_published
      t.string :condition
    end
  end
end
