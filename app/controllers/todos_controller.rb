class TodosController < ApplicationController
    before_action :require_login
   
    def index
        @todos = current_user.todos.order(:id)
    end

    def show
        @todo =  current_user.todos.find(params[:id])
    end

    def destroy
        todo = current_user.todos.find(params[:id])
        todo.destroy
        redirect_to todos_path, notice: "Task Deleted!"
    end

    def new
        @todo = current_user.todos.build
    end

    def create
        @todo = current_user.todos.build(todo_params)

        if @todo.save
            redirect_to todo_path(@todo), notice: "Todo task created!"
        else
            @errors = @todo.errors.full_messages
            render :new
        end
    end

    def edit
        @todo = current_user.todos.find(params[:id])
    end

    def update
           @todo = current_user.todos.find(params[:id])

        if @todo.update_attributes(todo_params)
            redirect_to todo_path(@todo), notice: "Todo task updated!"
        else
            @errors = @todo.errors.full_messages
            render :edit
        end
    end

    private

    def todo_params
        params.require(:todo).permit(:name, :description)
    end

end
