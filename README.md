Teambox Invoice
===============

Lightweight invoicing for Teambox.


Installation
------------

NB! In heavy development at the moment, not released yet.

Add to your Gemfile:

      group :plugins do 
        gem 'teambox_invoice', '~> 0.0.1'
      end

Bundle updated:

      bundle update

Generate migration:

      script/generate teambox_invoice_migration
      rake db:migrate

