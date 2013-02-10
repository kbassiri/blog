class PostsController < ApplicationController

  def index
    @post_all = Post.order("id DESC")
    #@post =Post.where(:authour_id => @authour.id)
  end


  def show
   @post = Post.find(params[:id])
    #read: shows a single record from the id from the list (index)
   #when user click show
  end

  def new
    @post = Post.new(:title => "default", :content => "default")
    logger.fatal "Should not reach this code"
    logger.warn @post
    @post_count = Post.count+1

  end

  def create    #has no template
    @post =  Post.new(params[:post]) #get the value from user typed in 
    logger.warn params[:post]
    if @post.save
      redirect_to(:action => "index")
    else
      render('new')
    end
  end
  def  update
     @post = Post.find(params[:id])
        if @post.update_attributes(params[:post])
          redirect_to(:action => "show", :id => @post.id)
        else
          @post_count = Post.count
          render('edit')
        end
  end

  def  delete
     @post= Post.find(params[:id])
  end

  def edit
    #I could not use this one because of strange route
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(:action => 'index')
  end
end

