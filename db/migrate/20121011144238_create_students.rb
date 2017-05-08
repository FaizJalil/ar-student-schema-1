require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      [:first_name, :last_name, :gender, :email, :phone].each do |x|
        t.string x
      end
      t.date :birthday
      t.references :teacher # one-to-many
      t.timestamps
    end

    create_table :teachers do |t|
      t.string :name
      t.timestamps
    end
  end
end
