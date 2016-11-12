require 'spec_helper'

describe Post do 
  it 'should have a title' do
    post = create(:post, title: "Title")
    expect(post.title).to eq("Title")
  end
end