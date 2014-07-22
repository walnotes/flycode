class OrganizationsController < ApplicationController
 before_filter :signed_in_user,
                 :only => [:index, :edit, :update, :create]
  before_filter :correct_user, :only => [:edit, :update]

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
    @title = "Create your organization"
  end

  def edit
    @title = "Edit organization"
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(params[:organization])
      redirect_to @organization, :flash => { :success => "Profile updated." }
    else
      @title = "Edit organization"
      render 'edit'
    end
  end

 def create
    @organization = current_user.organizations.build(params[:organization])
    if @organization.save
      redirect_to @organization, :flash => { :success => "Organization created!" }
    else
      render 'pages/home'
    end
  end

  private

    def correct_user
      @organization = Organization.find(params[:id])
      redirect_to(root_path, :flash => { :error => "The organization you tried to edit does not belong to you!" }) unless current_user?(@organization.user)
    end

end
