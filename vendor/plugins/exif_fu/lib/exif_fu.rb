# ExifFu
require 'mini_exiftool'
module Averails # :nodoc:
  module Exif # :nodoc:
    module Tags
      
      def self.included(base)
        base.extend ClassMethods
      end
      
      module ClassMethods
        def exif_fu
          include Averails::Exif::Tags::InstanceMethods
        end
      end
      
      module InstanceMethods
        # Camera ISO at the time of shooting
        def iso
          process_tags(%w{ iso })
        end
        
        # Orientation of the camera at the time of shooting
        def orientation
          process_tags(%w{ orientation })
        end
        
        # Information for the lens used 
        def lenstype
          process_tags(%w{ lenstype })
        end
        
        # Lens Aperture
        def aperture
          process_tags(%w{ aperturevalue })
        end
        
        # Shutterspeed or Exposure time
        def shutterspeed
          process_tags(%w{ shutterspeedvalue exposuretime })
        end
        
        # Date of shooting (assuming the camera information is correct)
        def shot_on
          process_tags(%w{ createdate })
        end
        
        # Original shooter of the image
        def shot_by
          process_tags(%w{ ownername })
        end
        
        # Returns infor for any tag sent
        def exif_tag(custom_tag)
          return tags(custom_tag)
        end
        
        protected
        # Iterates through a set of possible tags to return the requested value
        def process_tags(tags)
          result = nil
          i = 0
          until !result.nil? || i >= tags.length do
            result = tags("#{tags[i]}")
            i += 1
            result
          end
          return result
        end
        
        # Return requested tag
        def tags(tag_name)
          return MiniExiftool.new(self.full_filename)["#{tag_name}"]
        end
      end
      
    end
  end
end
