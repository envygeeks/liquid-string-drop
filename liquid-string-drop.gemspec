# Frozen-string-literal: true
# Copyright: 2017 Jordon Bedwell - MIT License
# Encoding: utf-8

$LOAD_PATH.unshift(File.expand_path("../lib", __FILE__))
require "liquid/drop/str/version"

Gem::Specification.new do |spec|
  spec.authors = ["Jordon Bedwell"]
  spec.version = Liquid::Drop::Str::VERSION
  spec.homepage = "http://github.com/envygeeks/liquid-string-drop"
  spec.description = "A drop that can be a string too"
  spec.summary = "A drop that is also a string"
  spec.files = %W(Gemfile) + Dir["lib/**/*"]
  spec.required_ruby_version = ">= 2.1.0"
  spec.email = ["jordon@envygeeks.io"]
  spec.name = "liquid-string-drop"
  spec.require_paths = ["lib"]
  spec.has_rdoc = false
  spec.license = "MIT"

  spec.add_development_dependency("rspec", ">= 3", "< 4")
  spec.add_development_dependency("luna-rspec-formatters", "~> 3.7")
  spec.add_runtime_dependency("liquid", "~> 4.0")
end
