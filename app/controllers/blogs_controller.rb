class BlogsController < ApplicationController

  before_filter :load_blog,     :only => [ :index, :show ]
  before_filter :load_calendar, :only => [ :index, :show ]

  def index
    render :action => :show
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  def create
    @blog = Blog.new(params[:blog])
    respond_to do |format|
      if @blog.save
        flash[:notice] = 'Blog was successfully created.'
        format.html { redirect_to(@blog) }
        format.xml  { render :xml => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        flash[:notice] = 'Blog was successfully updated.'
        format.html { redirect_to(@blog) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(blogs_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
    @by = params[:by]
    @value = params[:value]
    @blogs = case @by
     when 'tag': Blog.find_tagged_with(@value)
     when 'keyword': Blog.all(:conditions => [ 'LOWER(title) LIKE ? OR LOWER(content) LIKE ?', "%#{@value}%", "%#{@value}%"] )
     when 'date': Blog.for_day(params[:year].to_i, params[:month].to_i, params[:day].to_i)
     else []
    end
    
    if @blogs.size == 1
      @blog = @blogs.first
      load_calendar
      render :action => :show and return
    end
    
    load_calendar
  end
  
  protected
  def load_blog
    if params[:id]
      @blog = Blog.find(params[:id])
    else
      @blog = Blog.last
    end
  end
  
  def load_calendar
    @year  = params[:yr] ? params[:yr].to_i : (@blog ? @blog.created_at.year  : Date.today.year)
    @month = params[:mo] ? params[:mo].to_i : (@blog ? @blog.created_at.month : Date.today.month)
    @previous = { :year => @month == 1  ? @year - 1 : @year, :month => @month == 1  ? 12 : @month - 1 }
    @next     = { :year => @month == 12 ? @year + 1 : @year, :month => @month == 12 ? 1  : @month + 1 }
    
    @selected_days = Blog.for_month(@year, @month).collect { |b| b.created_at.mday }.uniq
  end
  
end
