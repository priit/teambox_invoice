class TeamboxInvoiceMigrationGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.migration_template 'create_invoices.rb', 'db/migrate',
        :migration_file_name => 'create_invoices'
    end
  end
end
