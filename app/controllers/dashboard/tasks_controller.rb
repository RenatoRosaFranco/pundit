class Dashboard::TasksController < Dashboard::HomeController   
  # Pundit 
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  before_action :set_task, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json

  def index
    if (current_user.admin? == true)
      @tasks = Task.all.recent
       .page(params[:page]).per(7)
    else
      @tasks = current_user.tasks.recent
       .page(params[:page]).per(7) 
      respond_with(@tasks)
    end
  end

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.save
    respond_with(:dashboard, @task)
  end

  def update
    authorize @task, :update?
    @task.update(task_params)
    respond_with(:dashboard, @task)
  end

  def destroy
    authorize @task, :destroy?
    @task.destroy
    respond_with(:dashboard, @task)
  end

  def search
    # some code to be implemented here
  end

  private
    def not_authorized
      redirect_to dashboard_path, notice: 'Not authorized'
    end

    def set_task
      @task = Task.find(params[:id])
      @comments = @task.comments.recent
       .page(params[:page]).per(2)
    end

    def task_params
      params.require(:task).permit(:name, :description, :status, :tags)
    end
end
