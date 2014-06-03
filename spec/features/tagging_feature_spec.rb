require 'spec_helper'

describe 'tagging posts' do 
  before do 
    emma = User.create(email: 'emma@e.com', password: '12345678', password_confirmation: '12345678')      
    login_as emma
  end
  it 'displays the tags on the posts page' do 
        visit 'posts/new'
        fill_in 'Title', with: 'My new post'
        fill_in 'Description', with: 'My first Picture'
        attach_file 'Picture', Rails.root.join('spec/images/image_1.jpg')
        fill_in 'Tags', with: 'more, hello'
        click_button 'Create Post'  

        expect(page).to have_link '#more'
        expect(page).to have_link '#hello'
  end

  it 'can filter posts by tag' do 
    create(:post, title: 'Pic1', tag_names: 'more')
    create(:post, title: 'Pic2', tag_names: 'hello')

    visit '/posts'
    click_link '#more'
    expect(page).not_to have_content 'Pic2'
  end
end