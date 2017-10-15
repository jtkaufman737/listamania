class CommentsController < ApplicationController
  # http_basic_authenticate_with name: "dhh", password: "secret", only:
  # :destroy


  def new
    @comment=Comment.new
  end

  def show
    @comment=Comment.find(params[:id])
  end

  def create
    @list = List.find(params[:list_id])
    @comment = @list.comments.create(comment_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @comment = @list.comments.find(params[:id])
    @comment.destroy
    redirect_to list_path(@list)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
