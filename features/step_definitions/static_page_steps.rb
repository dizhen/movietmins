Given /^a user visits the static pages$/ do
  visit root_path
end

When /^they visit the homepage$/ do
	visit root_path
end

Then /^they should see the name of the website$/ do
	expect(page).to have_content('Movietmins')
end
