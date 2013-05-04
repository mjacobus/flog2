class ActiveRecord::Base
  def self.random
    limit(1).offset(rand(count - 1)).first
  end
end

IMAGE_PATH = Rails.root. + 'db/seeds'

def add_pictures(picturable)
  (1..17).to_a.slice(rand(15),rand(15)).each do |num|
    picturable.pictures.create!(file: File.open("#{IMAGE_PATH}/pictures/#{"%02d" % num}.jpg"), home: (rand(15) == 1)
  end
end


%w(Casamentos Ensaios Animais).each do |category|
  Category.find_or_create_by_name_and_slug({
    name: category,
    slug: category.parameterize
  })
end

1.upto(10) do |n|
	album = Album.find_or_create_by_title_and_slug({
		title: "Album ##{n}",
		slug: "album-#{n}",
		category_id: Category.random.id
	})

	add_pictures(album)
end