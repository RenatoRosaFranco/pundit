module Dashboard 
  class ProfileController < HomeController
  	before_action :set_profile, only: [:show, :edit, :update]
  	respond_to :html, :json, :js 

  	def index
  	  @user = current_user 
      @tasks = Task.by_user(@user)
       .recent.page(params[:page]).per(2)
  	end

  	def show
      @tasks = Task.by_user(@profile)
       .recent.page(params[:page]).per(2)
  	end

  	def edit
  	end

  	def update
  	  # authorize @profile, :update?
  	  @profile.update(profile_params)
  	  respond_with dashboard_path, notice: ''
  	end

  	private

  	def set_profile
  	  @profile = User.find(params[:id])
  	end

  	def profile_params
  	  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
  end
end