require 'spec_helper'

describe Post do 
  it 'should have a title' do
    post = Post.new(title: "Title1")
    expect (post.title).to eq("Title1")
  end
end