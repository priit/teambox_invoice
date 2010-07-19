class CreateInvoiceTables < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer   :project_id
      t.string    :title
      t.string    :nr
      t.text      :provider_info
      t.text      :client_info
      t.decimal   :default_fee, :precision => 8, :scale => 2
      t.decimal   :price,       :precision => 8, :scale => 2
      t.decimal   :vat,         :precision => 8, :scale => 2
      t.string    :ccy
      t.text      :notes
      t.datetime  :due_at
      t.datetime  :issued_at
      t.timestamps
    end

    create_table :invoice_items do |t|
      t.integer   :invoice_id
      t.integer   :comment_id
      t.string    :title
      t.string    :notes
      t.float     :hours
      t.decimal   :fee,   :precision => 8, :scale => 2
      t.decimal   :price, :precision => 8, :scale => 2
      t.datetime  :issued_at
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
    drop_table :invoice_items
  end
end
