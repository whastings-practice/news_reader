# == Schema Information
#
# Table name: entries
#
#  id           :integer          not null, primary key
#  guid         :string(255)      not null
#  link         :string(255)      not null
#  title        :string(255)      not null
#  published_at :datetime         not null
#  feed_id      :integer          not null
#  json         :text             not null
#  created_at   :datetime
#  updated_at   :datetime
#  description  :text
#  content      :text
#

class Entry < ActiveRecord::Base
  # Add description attribute

  belongs_to :feed

  default_scope { order("published_at DESC") }

  def self.create_from_json!(entryData, feed)
    entryData.each do |k, v|
      next if k == :pubDate
      entryData[k] = v.try(:force_encoding, "utf-8")
    end
    # entryData[:guid] = entryData[:guid].try(:force_encoding, "utf-8")
    # entryData[:title] = entryData[:title].try(:force_encoding, "utf-8")
    # entryData[:description] = entryData[:description].try(:force_encoding, "utf-8")
    # entryData[:content_encoded] = entryData[:content_encoded].try(:force_encoding, "utf-8")

    Entry.create!({
      guid: entryData.guid,
      link: entryData.link,
      published_at: entryData.pubDate,
      title: entryData.title,
      json: entryData.to_json,
      feed_id: feed.id,
      description: entryData.description,
      content: entryData.content_encoded
    })
  end
end
