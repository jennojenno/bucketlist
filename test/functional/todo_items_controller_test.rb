require 'test_helper'

class TodoItemsControllerTest < ActionController::TestCase

	context "Todo items controller" do 
		setup do
				@todo_item = TodoItem.new(:name => "ZORBO")
				@todo_item.save! 
		end 

		context "GET to index" do
			setup do
				get :index
			end

			should "give me a HTTP200" do
				get :index
				assert_response :success
			end 

			should "give me 1 todo items" do
				assert_equal 1, assigns(:todo_item).length
				assert_equal TodoItem, assigns(:todo_item).first.class
			end 
		end

			context "GET to show" do
			setup do
				get :show, :id => 1
			end

			should "give me 1 todo item" do
				assert_equal TodoItem.find(1), assigns(:todo_item)
			end 
		end 
	end
end 