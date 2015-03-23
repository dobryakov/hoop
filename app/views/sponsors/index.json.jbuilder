json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :title
  json.url sponsor_url(sponsor, format: :json)
end
