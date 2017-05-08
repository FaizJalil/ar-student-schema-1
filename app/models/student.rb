class Student < ActiveRecord::Base
  # many-to-many implementation
  has_many :subjects
  has_many :teachers, through: :subjects

  # age and name method require these fields to work
  # unless you add condition to those methods, example:
  # def name
  #   if first_name && last_name
  #     first_name.to_s + " " + last_name.to_s
  #   end
  # end
  # which your code can get very ugly easily
  # so make a decision whethere first_name and last_name
  # is required for your app
  validates_presence_of :first_name, :last_name, :birthday

  # two ways of writing a validation
  validates :email, format: { with: /\w+@\w+\.\w+/ }, uniqueness: true, presence: true
  validates :phone_only_numeric, length: { minimum: 10 }

  # you can run validation on the return value of a custom method too
  validates :age, numericality: { greater_than: 4 }

  def name
    first_name + ' ' + last_name
  end

  def age
    ((Date.today - birthday) / 365).to_i
  end

  private

  def phone_only_numeric
    # what if phone is `nil`?
    phone.gsub(/[^0-9]/, '')
  end
end
