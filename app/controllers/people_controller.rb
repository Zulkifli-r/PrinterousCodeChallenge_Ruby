class PeopleController < ApplicationController
  before_action :get_organization
  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /people or /people.json
  def index
    @people = Person.all
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = @organization.people.build
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = @organization.people.build(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to organization_path(@organization), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to organization_path(@organization), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to organization_path(@organization), notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_organization 
      @organization = Organization.find(params[:organization_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = @organization.people.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name, :phone, :email, :organization, :avatar)
    end
end
