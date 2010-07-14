class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer   :project_id
      t.string    :title
      t.string    :nr
      t.text      :from
      t.text      :client
      t.text      :items
      t.integer   :price
      t.string    :ccy
      t.integer   :vat
      t.text      :notes
      t.datetime  :due_at
      t.datetime  :issued_at
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
