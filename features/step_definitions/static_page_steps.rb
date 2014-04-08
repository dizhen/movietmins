Given /^a user visits the static pages$/ do
  visit '/static_pages/home'
end

When /^they visit the homepage$/ do
	visit '/static_pages/home'
end

Then /^they should see the name of the website$/ do
	expect(page).to have_content('Movietmins')
end
