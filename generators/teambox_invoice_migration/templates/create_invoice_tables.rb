class CreateInvoiceTables < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer   :project_id
      t.string    :title
      t.string    :nr
      t.text      :from
      t.text      :client
      t.decimal   :price, :precision => 8, :scale => 2, :default => 0.0
      t.string    :ccy
      t.integer   :vat
      t.text      :notes
      t.datetime  :due_at
      t.datetime  :issued_at
      t.timestamps
    end

    create_table :invoice_items do |t|
      t.integer   :invoice_id
      t.integer   :comment_id
      t.text      :body
      t.text      :body_html
      t.decimal   :price, :precision => 8, :scale => 2, :default => 0.0
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
    drop_table :invoice_items
  end
end
