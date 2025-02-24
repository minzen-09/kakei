class Public::SearchesController < ApplicationController
  def search
    model = params[:model]
    keyword = params[:keyword]
    @result = []
    if model == "User" or model == "Post"
      @result = eval("#{model}.all")
      @result = @result.search(keyword) if params[:keyword].present?
    end
    render 'public/searches/result'
  end
end
