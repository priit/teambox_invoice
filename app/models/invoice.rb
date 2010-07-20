class Invoice < ActiveRecord::Base
  unloadable
  COMMON_ATTRIBUTES = %w[title provider_info client_info price ccy vat nr]

  has_many :items, :class_name => 'InvoiceItem'

  validates_presence_of :vat, :ccy
  accepts_nested_attributes_for :items

  class << self
    def new_or_from(other_id, opts = {})
      other_invoice = find_by_id(other_id)
      new_invoice = new(other_invoice.try(:common_attributes)) 
      new_invoice.build_items(opts[:items]) if opts[:items].present?
      new_invoice
    end
  end

  def build_items(comments)
    comments.each do |comment|
      items.build :title      => comment.target.name,
                  :notes      => comment.body,
                  :comment_id => comment.id,
                  :hours      => comment.hours,
                  :fee        => default_fee,
                  :issued_at  => comment.created_at
    end
  end

  def after_initialize
    write_attribute(:default_fee, 42) unless read_attribute(:default_fee) #TODO update nil fees with javascript 
    write_attribute(:vat, 0) unless read_attribute(:vat)
    write_attribute(:ccy, I18n.t('invoices.fields.default_ccy')) unless read_attribute(:ccy)
    write_attribute(:notes, I18n.t('invoices.fields.default_notes')) unless read_attribute(:notes)
  end

  def name
    title.to_s + issued_at.to_s + created_at.to_s
  end

  def common_attributes
    attributes.inject(HashWithIndifferentAccess.new) do |common_attributes,attr|
      common_attributes[attr.first] = attr.second if COMMON_ATTRIBUTES.include? attr.first
      common_attributes
    end
  end

  def vat_integer
    (vat * 100).to_i
  end

  def vat_integer=(value)
    write_attribute(:vat, value.to_i / 100.0)
  end

  def total_netprice
    items.map(&:price).sum
  end

  def total_hours
    items.map(&:hours).sum
  end

  def total_vat
    total_netprice * vat
  end

  def total
    total_netprice + total_vat
  end
end
