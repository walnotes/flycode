class OrganizationsController < ApplicationController
 before_filter :signed_in_user,
                 :only => [:index, :edit, :update, :create]
  before_filter :correct_user, :only => [:edit, :update, :destroy]

  def search
    @name = params[:name]
    @results = Organization.search(@name)
    @organizations = @results.paginate(page: params[:page], per_page: 10)
  end

  def show
    @organization = Organization.find(params[:id])
    @name = @organization.name
    @address = @organization.address
    @url = @organization.url
    @facebook = @organization.facebook
    @twitter = @organization.twitter
    @instagram = @organization.instagram
    @linkedin = @organization.linkedin
    @googleplus = @organization.googleplus
    @related = @organization.related
  end

  def new
    @organization  = Organization.new
    @title = "Create a Profile"
  end

  def edit
    @title = "Edit Profile"
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(params[:organization])
      redirect_to @organization, :flash => { :success => "Profile updated" }
    else
      @title = "Edit Profile"
      render 'edit'
    end
  end

  # def destroy
  #   @organization = Organization.find(params[:id])
  #   @organization.destroy
  #   # Organization.find(params[:id]).destroy
  #   flash[:success] = "Profile destroyed."
  #   # redirect_to users_url
  # end
  
  def destroy
    Organization.find(params[:id]).destroy
    flash[:success] = "Organization destroyed."
    redirect_to users_url
  end
  
  
  def create
    @organization = current_user.organizations.build(params[:organization])
    if @organization.save
      redirect_to @organization, :flash => { :success => "Profile created!" }
    else
      render 'pages/home'
    end
  end

  private

    def correct_user
      @organization = Organization.find(params[:id])
      redirect_to(root_path, :flash => { :error => "The profile you tried to edit does not belong to you!" }) unless current_user?(@organization.user)
    end

end
