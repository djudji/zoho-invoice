json.array!(@items) do |item|
  json.extract! item, :id, :description, :quantity, :rate, :amount
  json.url item_url(item, format: :json)
end
