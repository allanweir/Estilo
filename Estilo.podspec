Pod::Spec.new do |spec|
  spec.name = "Estilo"
  spec.version = "0.0.1"
  spec.summary = "Easy and extendable way of styling common UIKit components"
  spec.homepage = "hhttp://studiousdesigns.co.uk/"
  spec.license = { type: 'MIT', file: 'LICENSE.md' }
  spec.authors = { "Allan Weir" => 'allan@studiousdesigns.co.uk' }
  spec.social_media_url = "https://twitter.com/allanweir"

  spec.platform = :ios, "10.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/allanweir/Estilo.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "Estilo/**/*.{h,swift}"
  spec.framework    = 'UIKit'
end