class OrgsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_org, only: %i[show edit update destroy]
  # before_action :set_root_org, only: %i[]

  def index
    @orgs = policy_scope(Org)
    render json: @orgs
  end

  def show
    render json: @org
  end

  private

  def set_org
    @org = Org.find(params[:id])
    authorize @org
  end

  def set_root_org
    @org = Org.find(params[:org_id])
    authorize @org
  end

  def org_params
    params.require(:org).permit(Org.column_names)
  end
end
