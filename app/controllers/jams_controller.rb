class JamsController < ApplicationController


    before_action :set_jam, only: [:show, :update, :destroy, :edit, :send_request, :request_index, :accept_request, :decline_request]

    def index
        # @jams = UserJam.where(user_id: !current_user.id)
        @jams = UserJam.where("user_id != ?", current_user.id)
        @jams = @jams.collect{|jam| jam.jam_id}.uniq
        @jams.map do |jam|
            Jam.where(jam_id: jam)

            @binding.pry
        end
    end

    def show
        @user_jams = []
        @user_jams = UserJam.where(jam_id: @jam.id)
    end


    def new
        @jam = Jam.new
    end

    def create
        @jam = Jam.new(jam_params)
        @jam.save
        UserJam.create(status: "host", user_id: current_user.id, jam_id: @jam.id)
        redirect_to jam_path(@jam)
    end

    def edit

    end

    def update
        @jam.save
        redirect_to jam_path(@jam)
    end
    
    def destroy

    end


    #custom actions
    def request_index
        @requests = UserJam.where(jam_id: @jam.id, status: "request") 
        render "request_index"
    end

    def accept_request
        userjam_instance = UserJam.where(user: @user, jam_id: @jam.id)
        userjam_instance.update(status: "accepted")
        redirect_to jam_path(@jam)
    end

    def decline_request
        UserJam.where(user: @user, jam_id: @jam.id).destroy
        redirect_to jam_path(@jam)
    end

    def send_request
        UserJam.create(user_id: current_user.id, jam_id: @jam.id, status: "request") 
        flash[:notice] = "REQUEST SENT!"
        render "index"
    end

    private 
    def jam_params
        params.require(:jam).permit(:name, :space_id, {:genre_ids => []}, :date, :time, :info, :tunes)
    end

    def set_jam
        @jam = Jam.find(params[:id])
    end

end
