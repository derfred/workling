#
#  Discovery is responsible for loading workers in app/workers.
#
module Workling
  class Discovery
    cattr_accessor :discovered
    @@discovered = []

    # requires worklings so that they are added to routing.
    def self.discover!
      Workling.load_path.each do |p|
        Dir.glob(p).each { |wling| require wling }
      end
    end
  end
end
