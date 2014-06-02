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

      describe 'one tag' do 
        it 'adds a single tag to the post' do 
          post.tag_names = 'more'
          expect(post.tags.count).to eq 1
      end

      it 'prepends the tags with a # if neccessary' do 
        post.tag_names = 'more'
        tag = post.tags.last

        expect(tag.name).to eq "#more"
      end

      it 'does not double up #s' do 
      post.tag_names = '#hello'
      tag = post.tags.last

      expect(tag.name).to eq '#hello'
      end
    end

    describe 'multiple comma-separated tags' do 
      it 'adds each tag to the post' do 
        post.tag_names = 'more, hello'
        expect(post.tags.count).to eq 2
      end
    end

    describe 'reusing tags' do 
      let!(:tag) { Tag.create(name: '#yolo') }

      it 'reuses tags if they exist' do 
        post.tag_names = 'yolo'
        expect(Tag.count).to eq 1

        expect(tag.posts.count).toinclude post 
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