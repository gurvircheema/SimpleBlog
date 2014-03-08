class PostingsController < ApplicationController
  before_filter :authenticate, :except => [ :index, :show]
  def index
    @postings = Posting.all
  end
  
  def new
    @posting = Posting.new
  end

  def show
    @posting = Posting.find(params[:id])
  end
  
  def create
    @posting= Posting.new(posting_params)
    if @posting.save
      redirect_to @posting
    else
      render 'new'
    end
  end
  
  def edit
    @posting = Posting.find(params[:id])
  end
  
  def update
    @posting = Posting.find(params[:id])
    if @posting.update(posting_params)
      redirect_to @posting
    else
      render 'edit'
    end
  end

  def destroy
    Posting.find(params[:id]).destroy
    redirect_to postings_url
  end
  
  private
  def posting_params
    params.require(:posting).permit(:name, :blogpost)
  end
  
  def authenticate
    authenticate_or_request_with_http_basic do |name, passwd|
      name == 'admin' && passwd == 'secret' 
    end
  end
end
