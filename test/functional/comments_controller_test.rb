require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  
  context "A comment" do 
  	context "Post to /comments" do 
  		setup do
  			@todo_item = TodoItem.create
  			@todo_item.save!

  				post :create, comment: { body: "blah", todo_item_id: @todo_item.id}
  		end

  		should "increase comment count" do
  			assert_equal 1, Comment.count
  		end 

  		should "have an associated todo item" do
  			assert_equal assigns(:comment).todo_item, @todo_item
  		end 

  		should "give a http 200 response" do
  			get :index
  			assert_response :success
  		end 


  	end
  end
end
