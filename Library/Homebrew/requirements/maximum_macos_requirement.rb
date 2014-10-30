require 'requirement'

class MaximumMacOSRequirement < Requirement
  fatal true

  def initialize(tags)
    @version = MacOS::Version.from_symbol(tags.first)
    super
  end

  satisfy { MacOS.version <= @version }

  def message
    <<-EOS.undent
      OS X #{@version.pretty_name} or older is required for stable.
      Use `brew install devel or --HEAD` for newer.
    EOS
  end
end
