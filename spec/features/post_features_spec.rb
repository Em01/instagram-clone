require 'spec_helper'

describe 'posts index page' do 
  context 'no posts have been added' do 
    it 'should display a message' do 
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Make a Post'
    end
  end
end

describe 'Making a post' do 
  context 'logged out' do 
    it 'prompts us to sign in' do 
    visit '/posts'
    click_link 'Make a Post'

    expect(page).to have_content 'Sign in'
    end
  end

  context 'logged in' do 
    before do
      user = User.create(email: 'emma@e.com', password: '12345678', password_confirmation: '12345678')      
      login_as user
    end

  it 'adds it to the home page' do 
        visit 'posts/new'
        fill_in 'Title', with: 'My new post'
        fill_in 'Description', with: 'My first Picture'
        attach_file 'Picture', Rails.root.join('spec/images/image_1.jpg')
        

        click_button 'Create Post'

        expect(current_path).to eq '/posts'
        expect(page).to have_content 'My new post'
        expect(page).to have_css 'img.uploaded-pic'
      end
    end

describe 'deleting posts' do 
  context 'my post' do 
    before do 
      emma = User.create(email: 'emma@e.com', password: '12345678', password_confirmation: '12345678')      
      login_as emma
        Post.create(title: 'Hello', description: 'World', user: emma)
      end

    it 'is removed from the posts page' do 
      visit '/posts'
      click_link 'Delete'

      expect(page).to have_content 'Successfully deleted'
    end
  end

  context 'not my post' do 
    before do 
      emma = User.create(email: 'emma@e.com', password: '12345678', password_confirmation: '12345678')      
      stef = User.create(email: 'stef@e.com', password: '12345678', password_confirmation: '12345678') 
      Post.create(title: "Stef's pic", description: 'Test', user: stef)

      login_as emma
    end

    it 'shows no delete link' do 
      visit '/posts'
      expect(page).not_to have_link "Delete"
    end
  end
end
end

# describe 'Editing a post' do 
#   before { Post.create(title: 'Photo', description: 'a test picture')}

#   it 'saves the change to the post' do 
#         visit '/posts'
#         click_link 'Edit Photo'

#         fill_in 'Title', with: 'Changed title'
#         click_button 'Update Post'

#         expect(current_path).to eq '/posts'
#         expect(page).to have_content 'Changed title'
#     end
#   end

# describe 'Delete a post' do 
#    before { Post.create(title: 'Photo1', description: 'a test picture')}

#  it 'removes a post' do 
#         visit '/posts'
#           click_link 'Delete Photo1'
#           expect(page).not_to have_content 'Photo1'
#           expect(page).to have_content 'Deleted successfully'
#         end
#       end
  
#     describe 'Add a picture' do 
#       it 'adds a picture' do 
#         attach_file '' Rails.root.join ('spec/images/.jpg')
#         expect(page).to have_css 'img.uploadedpic'
#       end
# # end
# end
#  describe 'Delete a post' do 
#   before { Post.create(title: 'A photo', description: 'a test picture')}
# end









#   context ''
#   describe 'Making a post' do 
#   it 'adds it to the home page' do 
#         visit 'posts/new'
#         fill_in 'Title', with: 'Picture 1'
#         fill_in 'Description', with: 'My first Picture'
#         click_button 'Create Post'

#         expect(current_path).to eq   '/posts'
#         expect(page).to have_content 'Picture 1'
#       end
