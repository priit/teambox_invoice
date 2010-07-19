class TeamboxInvoiceMigrationGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.migration_template 'create_invoice_tables.rb', 'db/migrate',
        :migration_file_name => 'create_invoice_tables'
    end
  end
end
