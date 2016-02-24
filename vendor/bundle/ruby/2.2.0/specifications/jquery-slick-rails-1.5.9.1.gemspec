# -*- encoding: utf-8 -*-
# stub: jquery-slick-rails 1.5.9.1 ruby lib

Gem::Specification.new do |s|
  s.name = "jquery-slick-rails"
  s.version = "1.5.9.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ilya Bodrov"]
  s.date = "2015-12-02"
  s.description = "Integrates Slick carousel, a jQuery plugin by Ken Wheeler, into your Rails app."
  s.email = ["golosizpru@gmail.com"]
  s.homepage = "https://github.com/bodrovis/jquery-slick-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Integrates Slick carousel into Rails app."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1"])
      s.add_development_dependency(%q<rails>, ["~> 3.2.12"])
      s.add_development_dependency(%q<test-unit>, ["~> 3.0"])
    else
      s.add_dependency(%q<railties>, [">= 3.1"])
      s.add_dependency(%q<rails>, ["~> 3.2.12"])
      s.add_dependency(%q<test-unit>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1"])
    s.add_dependency(%q<rails>, ["~> 3.2.12"])
    s.add_dependency(%q<test-unit>, ["~> 3.0"])
  end
end
