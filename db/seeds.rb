ActiveRecord::Base.transaction do

  Feed.create!(
    url: 'http://lorem-rss.herokuapp.com/feed?unit=second&interval=10',
    title: 'Lorem Ipsum'
  )

  Feed.create!(
    url: 'http://lorem-rss.herokuapp.com/feed?unit=second&interval=30',
    title: 'Lorem Ipsum'
  )

end
