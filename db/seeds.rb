%w(casamentos ensaios animais).each do |category|
  Category.find_or_create_by_name_and_slug({
    name: category,
    slug: category.parameterize
  })
end