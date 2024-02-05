class Admin::RolesController < ApplicationController
  layout 'admin'
  before_action :set_role, only: %i[ show edit update destroy ]

  # GET /roles or /roles.json
  def index
    @roles = Role.all
    authorize @roles
  end

  # GET /roles/1 or /roles/1.json
  def show
    authorize @role
  end

  # GET /roles/new
  def new
    @role = Role.new
    authorize @role
  end

  # GET /roles/1/edit
  def edit
    authorize @role
  end

  # POST /roles or /roles.json
  def create
    @role = Role.new(role_params)
    authorize @role
    respond_to do |format|
      if @role.save
        if params[:create_and_add]
          format.html { redirect_to new_admin_role_path, notice: "Role was successfully created." }
        else
          format.html { redirect_to admin_roles_path, notice: "Role was successfully created." }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1 or /roles/1.json
  def update
    authorize @role
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to admin_role_url(@role), notice: "Role was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1 or /roles/1.json
  def destroy
    @role.destroy!
    authorize @role
    respond_to do |format|
      format.html { redirect_to admin_roles_url, notice: "Role was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def role_params
      params.require(:role).permit(:name)
    end
end
