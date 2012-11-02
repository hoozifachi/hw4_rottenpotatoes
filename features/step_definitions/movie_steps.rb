
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    movie_record = Movie.new
    movie_record.title = movie['title']
    movie_record.rating = movie['rating']
    movie_record.director = movie['director']
    movie_record.release_date = movie['release_date']
    movie_record.save
  end
end

Then /the director of "([^"]*)" should be "([^"]*)"/ do |movie_name, director|
  if page.respond_to? :should
    page.should have_content(movie_name)
    page.should have_content(director)
  else
    assert page.has_content?(movie_name)
    assert page.has_content?(director)
  end

end
