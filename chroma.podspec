Pod::Spec.new do |spec|
  spec.name = 'chroma.swift'
  spec.version  = '0.0.3'
  spec.author = { 'Econa77' => 's.f.1992.ip@gmail.com' }
  spec.homepage = 'https://github.com/Econa77/chroma.swift'
  spec.summary = '[WIP] Swift version of Chroma.js( https://github.com/gka/chroma.js )'
  spec.source = { :git => 'https://github.com/Econa77/chroma.swift.git', :tag => "v#{spec.version}" }
  spec.license = { :type => 'BSD-3-Clause', :file => 'LICENSE' }
  spec.requires_arc = true
  spec.source_files = 'Sources/**/*.{swift}'
  spec.ios.deployment_target = '9.0'
  spec.osx.deployment_target = '10.9'
  spec.frameworks = 'CoreGraphics'
end
