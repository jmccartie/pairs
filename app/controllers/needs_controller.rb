class NeedsController < ApplicationController
  before_filter :require_login
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
  #before_filter :require_login

  # GET /needs
  # GET /needs.json
  def index
    @needs = Need.includes(:wo_status, :zone, :affected => [:contact]).order(sort_column + ' ' + sort_direction).all

    @map = Need.includes(:affected => [{:contact => :address}]).all.to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @needs }
    end
  end

  def map
    @needs = Need.all

    respond_to do |format|
      format.json
    end
  end

  # GET /needs/1
  # GET /needs/1.json
  def show
    @need = Need.find(params[:id])
    @map = @need.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @need }
    end
  end

  # GET /needs/new
  # GET /needs/new.json
  def new
    @need = Need.new
    @need.build_affected
    @need.affected.contact = Contact.new
    @need.affected.contact.address.nil? ? @need.affected.contact.build_address : ""

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @need }
    end
  end

  # GET /needs/1/edit
  def edit
    @need = Need.find(params[:id])
    @need.affected.contact.address.nil? ? @need.affected.contact.build_address : ""
  end

  # POST /needs
  # POST /needs.json
  def create
    @need = Need.new(params[:need])

    respond_to do |format|
      if @need.save
        format.html { redirect_to @need, notice: 'Work order was successfully created.' }
        format.json { render json: @need, status: :created, location: @need }
      else
        format.html { render action: "new" }
        format.json { render json: @need.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /needs/1
  # PUT /needs/1.json
  def update
    @need = Need.find(params[:id])

    respond_to do |format|
      if @need.update_attributes(params[:need])
        format.html { redirect_to @need, notice: 'Work order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @need.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /needs/1
  # DELETE /needs/1.json
  def destroy
    @need = Need.find(params[:id])
    @need.destroy

    respond_to do |format|
      format.html { redirect_to needs_url }
      format.json { head :no_content }
    end
  end

  private
  def sort_column
    params[:sort] || "created_at"
  end

  def sort_direction
    params[:direction] || "asc"
  end
end
