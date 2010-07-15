class Invoice < ActiveRecord::Base
  unloadable

  validates_presence_of :price, :vat, :ccy

  class << self
    def new_or_from(other_id)
      if other = find_by_id(other_id)
        new(other.common_attributes)
      else
        new
      end
    end
  end

  def name
    title.to_s + issued_at.to_s + created_at.to_s
  end

  def common_attributes
    attributes.inject({}) do |h,ar|
      h[ar.first] = ar.second if %w[title from client price ccy vat nr].include? ar.first
      h
    end
  end
end
