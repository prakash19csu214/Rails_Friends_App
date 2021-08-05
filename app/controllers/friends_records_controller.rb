class FriendsRecordsController < ApplicationController
  before_action :set_friends_record, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except:[:index, :show]
  before_action :correct_user, only:[:edit, :update, :destroy]

  # GET /friends_records or /friends_records.json
  def index
    @friends_records = FriendsRecord.all
  end

  # GET /friends_records/1 or /friends_records/1.json
  def show
  end

  # GET /friends_records/new
  def new
    
    #@friends_record = FriendsRecord.new
    @friends_record = current_user.friends_record.build
  end

  # GET /friends_records/1/edit
  def edit
  end

  # POST /friends_records or /friends_records.json
  def create
    #@friends_record = FriendsRecord.new(friends_record_params)
    @friends_record = current_user.friends_record.build(friends_record_params)
    respond_to do |format|
      if @friends_record.save
        format.html { redirect_to @friends_record, notice: "Friends record was successfully created." }
        format.json { render :show, status: :created, location: @friends_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friends_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends_records/1 or /friends_records/1.json
  def update
    respond_to do |format|
      if @friends_record.update(friends_record_params)
        format.html { redirect_to @friends_record, notice: "Friends record was successfully updated." }
        format.json { render :show, status: :ok, location: @friends_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friends_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends_records/1 or /friends_records/1.json
  def destroy
    @friends_record.destroy
    respond_to do |format|
      format.html { redirect_to friends_records_url, notice: "Friends record was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def correct_user
    @friends_record = current_user.friends_record.find_by(id: params[:id])
    redirect_to friends_record_path, notice: "Not Authorized To Edit This Friend" if @friends_record.nil?
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friends_record
      @friends_record = FriendsRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friends_record_params
      params.require(:friends_record).permit(:first_name, :last_name, :email, :twitter, :phone, :user_id)
    end
end
