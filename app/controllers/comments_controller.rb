class CommentsController < ApplicationController

 def index
   #@comments = Comment.order(params[:sort])
   @comments = Comment.all
 end

 def show
  @comment = Comment.find(params[:id])
 end

 def new
  @comment = Comment.new()
 end

 def create
   @comment = Comment.all
   if @comment.save
     redirect_to(:action => "index")
   else
     render('new')
   end

 end

 def update

 end

 def delete

 end

 def edit

 end

 def destroy

 end

end
