json.(feed, :id, :title, :favorite)

entries ||= nil
unless entries.nil?
  json.entries(entries) do |entry|
    json.partial!('entries/entry', entry: entry)
  end
end