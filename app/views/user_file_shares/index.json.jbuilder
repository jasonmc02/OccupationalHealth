json.array!(@user_file_shares) do |user_file_share|
  json.extract! user_file_share, :id, :user_id, :file_id
  json.url user_file_share_url(user_file_share, format: :json)
end
