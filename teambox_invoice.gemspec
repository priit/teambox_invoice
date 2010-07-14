# encoding: utf-8

Gem::Specification.new do |s|
  s.name    = 'teambox_invoice'
  s.version = '0.0.1'

  s.summary     = 'Invoices for Teambox'
  s.description = 'Lightweight invoices for Teambox'
  s.authors     = ['Priit Tamboom']
  s.email       = 'priit@mx.ee'
  s.homepage    = 'http://priit.mx.ee'

  s.required_rubygems_version = '>= 1.3.0'
  s.files = Dir.glob("{app,generators,lib,config}/**/*") + %w(README.md)
  s.require_paths = ['lib']
  s.rubyforge_project = 'teambox_invoice'
  s.add_runtime_dependency('pdfkit', ['~> 0.3.3'])
end
