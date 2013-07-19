Gem::Specification.new do |s|
  # Release Specific Information
  s.version = "0.1.1"
  s.date = "2013-07-19"

  # Gem Details
  s.name = "compass-chameleon"
  s.summary = %q{A theming/skinning extension for Compass.}
  s.description = %q{Chameleon is a theming/skinning extension for Compass. Chameleon allows you to define themes and output themed CSS properties for each theme.}
  s.authors = ["Leon de Rijke"]
  s.email = ["leon@leonderijke.nl"]
  s.homepage = "https://github.com/leonderijke/compass-chameleon"
  s.license = "MIT"

  # Gem Files
  s.files = ["README.md"]
  s.files += ["CHANGELOG.md"]
  s.files += Dir.glob("lib/**/*.*")
  s.files += Dir.glob("stylesheets/**/*.*")

  # Gems Dependencies
  s.add_dependency("sass",      [">=3.2.0"])
  s.add_dependency("compass",   [">= 0.12.1"])
end