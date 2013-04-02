# 4288x2848  1
# 2144x1424  1/2
# 1072x712   1/4
# 536x356    1/8
# 268x178    1/16
# 134x89     1/32
#
#
class Picture < ActiveRecord::Base
  attr_accessible :description, :file, :picturable_id, :title
  belongs_to :picturable, polymorphic: true

    has_attached_file :file,
      :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style.:extension",
      :url => "/system/:class/:attachment/:id_partition/:style.:extension",
      :styles => {
        :original   => "1072x1072>",
        :big        => "536x536>",
        :medium     => "268x268>",
        :small      => "134x134>",
      },
      :convert_options => {
        :original   => "-strip",
        :big        => "-quality 75 -strip ",
        :medium     => "-quality 75 -strip",
        :small      => "-quality 75 -strip",
      }

  validates_attachment :file, :presence => true,
    :content_type => { :content_type => ['image/jpeg', 'image/png'] },
    :size => { :less_than => 10.megabytes }

  validates :title, presence: true
end
