module Treat
  module Processors
    module Chunkers
      # This class separates a plain text file into 
      # zones based on a very naive analysis of the 
      # file.
      class Txt
        # Split a document into Zone objects.
        def self.chunk(text, options = {})
          zones = text.to_s.split("\n")
          zones.each do |zone|
            next if zone.strip == ''
            if false # fix
              text << Treat::Entities::List.new(zone)
            end
            if zone.length < 60
              text << Treat::Title.new(zone)
            else
              text << Treat::Paragraph.new(zone)
            end
          end
          text
        end
      end
    end
  end
end