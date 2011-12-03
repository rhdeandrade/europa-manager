class Employee
  include Mongoid::Document
  field :name, :type => String
  field :cpf, :type => String

	validates_presence_of :name
	validates_presence_of :cpf

	has_many :sales
end
