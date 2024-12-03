# -*- encoding: utf-8 -*-
# stub: ruby-lsp-rails 0.3.26 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-lsp-rails".freeze
  s.version = "0.3.26".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "changelog_uri" => "https://github.com/Shopify/ruby-lsp-rails/releases", "documentation_uri" => "https://shopify.github.io/ruby-lsp/rails-add-on.html", "homepage_uri" => "https://github.com/Shopify/ruby-lsp-rails", "source_code_uri" => "https://github.com/Shopify/ruby-lsp-rails" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Shopify".freeze]
  s.date = "2024-11-08"
  s.description = "A Ruby LSP addon that adds extra editor functionality for Rails applications".freeze
  s.email = ["ruby@shopify.com".freeze]
  s.homepage = "https://github.com/Shopify/ruby-lsp-rails".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.5.23".freeze
  s.summary = "A Ruby LSP addon for Rails".freeze

  s.installed_by_version = "3.5.22".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<ruby-lsp>.freeze, [">= 0.21.2".freeze, "< 0.22.0".freeze])
end