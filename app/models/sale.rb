class Sale
  include Mongoid::Document
  field :sold_on, :type => Date
  field :last_change_on, :type => Date
  field :change_chamber, :type => Boolean
  field :price, :type => Float
  field :plan, :type => String

  belongs_to :customer
  belongs_to :product
	belongs_to :employee

  has_many :chamber_changes, class_name: "Sale"
  belongs_to :sale

  validates_presence_of :product_id
  validates_presence_of :customer
  validates_presence_of :plan
  validates_presence_of :price, :message => "Escolha um cliente"

  def customer_name
  	customer.name if customer
  end
end
