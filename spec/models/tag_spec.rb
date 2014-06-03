require 'spec_helper'

describe Tag, type: :model do 
  xit 'should be unique' do 
    Tag.create(name: '#hello')
    duplicate = Tag.new(name: '#hello')

    expect(duplicate).to have(1).error_on(:name)
  end
end


# RSpec.describe Tag, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
