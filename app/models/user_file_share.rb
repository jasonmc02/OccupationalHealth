class UserFileShare < ActiveRecord::Base

  belongs_to :user_file

  def self.fetch_user_file_shares(file_id, current_user)
    result = []
    admins = User.select([:id, :email]).where("users.role_id = ? and users.id != ?", Rails.configuration.admin_role, current_user)
    shares = UserFileShare.select(:user_id).where(:user_file_id => file_id)
    shares = shares.map {|share| share.user_id }
    admins.each do |admin|
      is_shared = shares.include?(admin.id)
      result.push({
        :id => admin.id,
        :email => admin.email,
        :is_shared => is_shared
      })
    end
    result
  end

  def self.upsert_user_file_shares(users, file_id, user_email)
    email_users = []
    users.map do |user|
      share = UserFileShare.where(:user_id => user[1][:user_id], :user_file_id => file_id).first
      unless share.blank?
        if user[1][:share].eql?("false")
          share.destroy
        end
      else
        if user[1][:share].eql?("true")
          share = UserFileShare.new(:user_id => user[1][:user_id], :user_file_id => file_id)
          share.save
          params = {
            :shared_to => User.find(user[1][:user_id]).email,
            :shared_from => user_email
          }
          FileShare.file_shared(params).deliver
        end
      end
    end
    {success: true}
  end

  def self.stop_sharing(file_id, current_user)
    share = UserFileShare.where(:user_file_id => file_id, :user_id => current_user)
    share.destroy_all
    {success: true}
  end
end
