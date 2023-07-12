json.extract! post, :id, :caption, :longitude, :latitude, :user_id, :allow_comments, :show_likes, :created_at, :updated_at
json.url post_url(post, format: :json)
