class ProfilesController < ApplicationController
 before_filter :signed_in_user,
                 :only => [:index, :edit, :update, :create]
  before_filter :correct_user, :only => [:edit, :update, :destroy]

  def search
    search_text = params[:name]
    @results = Profile.search(search_text)
    @profiles = @results.paginate(page: params[:page], per_page: 10)
  end

  def show
    @profile = Profile.find(params[:id])
    # @profile = ProfilesHelper.decode(@profile)
    @name = @profile.name
    @address = @profile.address
    @url = @profile.url
    @facebook = @profile.facebook
    @twitter = @profile.twitter
    @instagram = @profile.instagram
    @linkedin = @profile.linkedin
    @googleplus = @profile.googleplus
    @related = @profile.related
    @audio = @profile.audio
    @video = @profile.video
  end

  def new
    @profile  = Profile.new
    @title = "Create a Profile"
  end

  def edit
    @title = "Edit Profile"
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    # @profile = ProfilesHelper.encode(@profile)
    if @profile.update_attributes(profile_params)
      redirect_to @profile, :flash => { :success => "Profile updated" }
    else
      @title = "Edit Profile"
      render 'edit'
    end
  end

  def destroy
    @profile.destroy
    flash[:success] = "Profile destroyed."
    redirect_to users_url
  end
  
  # def destroy
  #   Profile.find(params[:id]).destroy
  #   flash[:success] = "Profile destroyed."
  #   redirect_to users_url
  # end
  
  
  def create
    @profile = current_user.profiles.build(profile_params)
    @profile = ProfilesHelper.encode(@profile)


    if @profile.save
      redirect_to @profile, :flash => { :success => "Profile created!" }
    else
      render 'pages/home'
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :url, :facebook, :twitter, :instagram, :linkedin, :audio, :video, :tag_list)
  end

  def correct_user
    @profile = Profile.find(params[:id])
    redirect_to(root_path, :flash => { :error => "The profile you tried to edit does not belong to you!" }) unless current_user?(@profile.user)
  end

end
