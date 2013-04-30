class TodoItemsController < ApplicationController
	 def index
    @todo_items = TodoItem.all
   end

   def show
    @todo_item = TodoItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo_item }
    end
  end


    def create
    @todo_item = TodoItem.new(params[:todo_item])

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to @todo_item, notice: 'todo_item was successfully created.' }
        format.json { render json: @todo_item, status: :created, location: @todo_item }
      else
        format.html { render action: "new" }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end
end
