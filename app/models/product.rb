class Product
  include Mongoid::Document
  field :name, :type => String
  field :validity, :type => Integer
  
  validates :validity, :numericality => true
end
