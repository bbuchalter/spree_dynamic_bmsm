# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_dynamic_bmsm'
  s.version     = '1.3.3'
  s.summary     = 'dynamic buy more save more'
  s.description = 'dynamically create and manage buy more save more promotion tiers'
  s.required_ruby_version = '>= 1.8.7'

  s.author    = 'Uri Mikhli'
  s.email     = 'urimikhli@gmail.com'
  s.homepage  = 'https://github.com/urimikhli/spree_dynamic_bmsm'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.3.3'

  s.add_development_dependency 'capybara', '~> 2.0'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
end
