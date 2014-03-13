json.array!(@entries) do |entry|
  json.partial!('entries/entry', entry: entry)
end