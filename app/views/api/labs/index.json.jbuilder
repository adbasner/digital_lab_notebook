json.labs do
  json.array! @labs, partial: 'lab', as: :lab
end
# json.labs @labs
json.role @role