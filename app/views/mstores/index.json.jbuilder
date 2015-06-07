json.array!(@mstores) do |mstore|
  json.extract! mstore, :id, :position, :price
  json.url mstore_url(mstore, format: :json)
end
