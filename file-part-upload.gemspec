# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'file_part_upload/version'

Gem::Specification.new do |spec|
  spec.name          = 'file-part-upload'
  spec.version       = FilePartUpload::VERSION
  spec.authors       = ["fushang318"]
  spec.email         = ["fushang318@gmail.com"]
  spec.summary       = ""
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12.3"
  spec.add_development_dependency "rake", "~> 11.2.2"

  # 以下为 rails engine 依赖
  spec.add_development_dependency 'actionpack', '~> 5.0.0'
  spec.add_development_dependency 'activesupport', '~> 5.0.0'

  spec.add_development_dependency 'jquery-rails', '~> 4.1.1'
  spec.add_development_dependency 'uglifier'

  spec.add_runtime_dependency 'mime-types'
  spec.add_runtime_dependency 'enumerize'
  spec.add_runtime_dependency 'qiniu', '~> 6.4.1'
end
