class UserFile < ActiveRecord::Base

  belongs_to :user
  has_many :user_file_shares

  mount_uploader :file, FileUploader

  #before_save :update_asset_attributes
  before_destroy :destroy_file_shares

  private

  def update_asset_attributes
    if file.present? && file_changed?
      self.file.content_type = file.file.content_type
      self.file.file_size = file.file.size
    end
  end

  def destroy_file_shares
    shares = UserFileShare.where(:user_file_id => self.id)
    shares.destroy_all
  end
end
