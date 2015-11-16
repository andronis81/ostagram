class QueueImage < ActiveRecord::Base
  has_many :pimages , dependent: :destroy
  belongs_to :user
  mount_uploader :content_image, AvatarUploader
  mount_uploader :style_image, AvatarUploader

  def result_image
    if pimages.count > 0
      pimages.all.order('created_at ASC').first
    end
  end
end