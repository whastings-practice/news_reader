json.array!(@feeds) do |feed|
  json.partial!('feeds/feed', feed: feed)
end