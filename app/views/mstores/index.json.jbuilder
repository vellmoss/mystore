
=begin
json.array!(@mstores) do |mstore|
  json.extract! mstore, :position, :price , :updated_at
#  json.url mstore_url(mstore, format: :json)
  json.Действия "изменить удалить"
end
=end


json.data @mstores do |mstore|
#  json.(mstore, :id, :position, :price , :updated_at)
  json.(mstore, :id, :position, :price)
  json.updated_at(mstore.updated_at.to_s)
  json.Действия '<a href=mstores/'+mstore.id.to_s+'>Изменить</a>'+'  <a data-confirm="Вы уверены?" data-method="delete"  href=mstores/'+mstore.id.to_s+'>Удалить</a>'
end