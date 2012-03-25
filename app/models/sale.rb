# encoding:utf-8
class Sale
  include Mongoid::Document
  field :sold_on, :type => Date
  field :last_change_on, :type => Date
  field :change_chamber, :type => Boolean
  field :price, :type => Float
  field :price_commission, :type => Float
  field :percentage, :type => Float
  field :plan, :type => String

  belongs_to :customer
  belongs_to :product
  belongs_to :employee

  has_many :chamber_changes, class_name: "Sale"
  belongs_to :sale

  validates_presence_of :product_id, :on => :create && :update
  validates_presence_of :customer, :on => :create && :update
  validates_presence_of :plan, :on => :create && :update
  validates_presence_of :percentage, :message => "Insira a taxa de comissão", :on => :create && :update
  validates_presence_of :price_commission, :message => "Insira o valor para cálculo da comissão", :on => :create && :update
  validates_numericality_of :price, :message => "Deve ser um número (Use . ao invés de ,)", :on => :create && :update
  validates_numericality_of :price_commission, :message => "Deve ser um número (Use . ao invés de ,)", :on => :create && :update
  validates_numericality_of :percentage, :message => "Deve ser um número (Não use % apenas o valor)", :on => :create && :update
  validates_presence_of :price, :message => "Insira um preço de venda", :on => :create && :update

  def customer_name
  	customer.name if customer
  end
end
