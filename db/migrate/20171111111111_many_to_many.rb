require_relative '../config'

# requirements changed
# one-to-many to many-to-many

class ManyToMany < ActiveRecord::Migration
  def change
    remove_column :students, :teacher_id

    create_table :subjects do |s|
      s.references :teacher
      s.references :student
    end
  end
end
