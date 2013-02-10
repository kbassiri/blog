class AuthoursController< ApplicationController

  #layout "admin"  #does not work with colon :admin gives error

  def index
    #debugger
    @authour_all = Authour.all
  end

  def show
    @authour_rec = Authour.find(params[:id])
    #@authour_rec.show
    #logger.info("#{Time.now}  Showed Authour ID ##{@authour.id}!")
    @posts = @authour_rec.posts
  end

  def new
    @authour = Authour.new()
  end

  def edit
    @authour = Authour.find(params[:id])
  end

  def create
    @authour =  Authour.new(params[:authour]) #get the value from user typed in 
    if @authour.save
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def update

    @authour = Authour.find(params[:id])
    if @authour.update_attributes(params[:authour])
      redirect_to(:action => "index", :id => @authour.id)
    else
      render("edit")
    end
  end

  def delete
    @authour = Authour.find(params[:id])
  end

  def  destroy
    @authour = Authour.find(params[:id])
    @authour.destroy
    logger.info("#{Time.now} Destroyed AuthourKer ID ##{@authour.id}!")
    redirect_to(:action => "index") 
  end

end
