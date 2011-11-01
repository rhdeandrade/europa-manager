# encoding:utf-8
class Customer
  include Mongoid::Document
  field :name, :type => String
  field :date_of_birth, :type => Date
  field :cpf, :type => String
  field :rg, :type => String
  field :address, :type => String
  field :neighborhood, :type => String
  field :city, :type => String
  field :cep, :type => String
  field :work_address, :type => String
  field :phone_number, :type => String
  field :mobile_phone, :type => String

  key :cpf

  validates :cpf, :presence => true
  validates_uniqueness_of :cpf
  validates :name, :presence => true
  validates :date_of_birth, :presence => true
  validates :rg, :presence => true
  validates :phone_number, :presence => true
  validates :address, :presence => true
  validates_numericality_of :cpf, :message => "CPF Sem . ou , e - apenas números"
  validates_numericality_of :rg, :message => "RG Sem . apenas números"
  validates :city, :presence => true

  has_many :sales
end
