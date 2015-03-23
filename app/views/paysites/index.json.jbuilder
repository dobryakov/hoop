json.array!(@paysites) do |paysite|
  json.extract! paysite, :id, :title, :sponsor_id
  json.url paysite_url(paysite, format: :json)
end
