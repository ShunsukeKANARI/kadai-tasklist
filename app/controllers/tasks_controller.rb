class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      @user = current_user
      @tasks = current_user.tasks.order('created_at').page(params[:page]).per(10)
    end
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    
      if @task.save
        flash[:success] = '追加完了'
        redirect_to @task
      else
        flash.now[:danger] = '追加失敗（文字数が256文字以上だったり空欄だとダメです）'
        render :new
      end
    
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'やることは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'やることは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy

    flash[:success] = 'やることは正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      flash[:danger] = '不正なアクセスです'
      redirect_to root_url
    end
  end
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
end