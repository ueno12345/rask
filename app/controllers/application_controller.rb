class ApplicationController < ActionController::Base
  include SessionsHelper
  add_flash_types :success, :warning, :danger

  # session と params の authenticity_token が一致しない場合，セッションを空にする
  protect_from_forgery with: :null_session

  before_action :logged_in_user

  private

  # ユーザーのログインを確認する
  def logged_in_user
    unless logged_in?
      respond_to do |format|
        format.html {
          flash[:danger] = "この操作にはログインが必要です"
          redirect_to root_path
        }
        format.json {
          render status: 401, json: { status: 401, message: 'Unauthorized' }
        }
      end
    end
  end
end
