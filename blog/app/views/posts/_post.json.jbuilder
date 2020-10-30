json.extract! post, :id, :title, :genre, :noofpages, :description, :created_at, :updated_at
json.url post_url(post, format: :json)
