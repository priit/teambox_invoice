
Teambox Invoice
===============

Lightweight invoicing for Teambox.


Installation
------------

Add to your Gemfile's plugins group:

  group :plugins do 
    gem 'teambox', '~> 0.1.0'
  end

Generate migration:

  script/generate teambox_invoice_migration
  rake db:migrate

