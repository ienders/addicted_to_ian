class BlogsController < ApplicationController

  before_filter :load_blog,     :only => [ :index, :show, :destroy, :update ]
  before_filter :load_calendar, :only => [ :index, :show ]
  before_filter :load_twitter_client

  def index
    render :action => :show
  end

  def rss
    @blogs = Blog.all(:order => 'created_at DESC', :limit => 5)
    render :layout => false
  end

  def show; end

  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      flash[:notice] = 'Blog was successfully created.'
      redirect_to(@blog)
    else
      render :action => "new"
    end
  end

  def update
    if @blog.update_attributes(params[:blog])
      flash[:notice] = 'Blog was successfully updated.'
      redirect_to(@blog)
    else
      render :action => "edit"
    end
  end
  
  def new_photo_field
    render :partial => 'blog_photo_fields', :locals => { :num => params[:num] }
  end

  def destroy
    @blog.destroy
    redirect_to(blogs_url)
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
