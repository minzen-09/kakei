class Admin::SearchesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def search
    model = params[:model]
    keyword = params[:keyword]
    @result = []
    if model == "User" or model == "Post"
      @result = eval("#{model}.all")
      @result = @result.search(keyword) if params[:keyword].present?
    end
    render 'admin/searches/result'
  end
end
