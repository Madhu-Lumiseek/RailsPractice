json.extract! postt, :id, :title, :genre, :noofpages, :rating, :canreadanyone, :description, :created_at, :updated_at
json.url postt_url(postt, format: :json)
