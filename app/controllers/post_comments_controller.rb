class PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    # 上記comment.post_image_id…の記載方法は下記の記載方法の省略
    # comment = PostComment.new(post_comment_params)
    # comment.user_id = current_user.id

    comment.save

    redirect_to post_image_path(post_image)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
    # post_imageのidを取得してそのidの投稿詳細画面(post_imageのshow)に遷移する
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end