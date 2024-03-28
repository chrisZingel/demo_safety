class OrganisationsController < ApplicationController
  before_action :get_current_user_organisation, only: [:edit, :update, :index]
  # GET /organisations/new
  # User cannot be login for this action (since a users can only belong to one organisation)
  def new
    @organisation = Organisation.new
    @organisation.users.build
  end

  def update
    authorize @organisation
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to organisations_url, notice: "Organisation was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def edit
    authorize @organisation
  end

  def index
    authorize @organisation
  end

  def show
    @organisation = Organisation.find(params[:id])
    authorize @organisation
  end

  # POST /videos or /videos.json
  def create
    @organisation = Organisation.new(organisation_params)
    authorize @organisation
    respond_to do |format|
      if @organisation.save
        format.html { redirect_to organisations_url, notice: "organisation was successfully created. To view you need to login as that user" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  # Strong Params: Only allow a list of trusted parameters through.
  def organisation_params
    params.require(:organisation).permit(:name, :description, users_attributes: [:role, :email, :password, :password_confirmation])
  end

  def get_current_user_organisation
    @organisation = current_user.organisation
  end
end
