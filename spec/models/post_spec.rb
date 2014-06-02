require 'spec_helper'

describe Post do 
  let(:post) { create(:post) }

  describe '#tag_names=' do 
    describe 'no tags' do 
      it 'does nothing' do 
        post.tag_names = ''
        expect(post.tags).to be_empty
      end
    end
  end
end

# describe  do
#     it 'is not valid without a name' do 
#       post = Post.new(title: nil)
#       expect(post).to have(1).errors_on(:title)
#     end
    # it 'should have a title' do
    #   visit '/instamaker_pages/home'
    #   page.should have_title('h1', :text => 'Instamaker')
         # end