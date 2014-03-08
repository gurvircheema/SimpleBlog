class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :name
      t.text :blogpost

      t.timestamps
    end
  end
end
