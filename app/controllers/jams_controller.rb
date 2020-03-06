class JamsController < ApplicationController

    before_action :set_jam, only: [:show, :update, :destroy, :edit, :request_index, :accept_request, :decline_request]

    def index
        @jams = UserJam.where("user_id != ?", current_user.id) #filtering out current users jam requests
        @users_jams = UserJam.where("user_id = ?", current_user.id)
        @jams = @jams.collect{|jam| jam.jam_id}.uniq
        @users_jams = @users_jams.collect{|users_jam| users_jam.jam_id}.uniq

        @solution = @jams
        @jams = []

        @solution.each do |jam|
            if !@users_jams.include?(jam)
                @jams << jam
            end 
        end

        @jams = @jams.map do |jam|
            Jam.where(id: jam)
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
        if @jam.valid?
            @jam.save
            UserJam.create(status: "host", user_id: current_user.id, jam_id: @jam.id)
            redirect_to jam_path(@jam)
        else
            render new_jam_path
        end
    end

    def edit

    end

    def update
        @jam.save
        redirect_to jam_path(@jam)
    end

    #custom actions
    def request_index
        @requests = UserJam.where(jam_id: @jam.id, status: "request") 
        render "request_index"
    end

    def accept_request
        user_id = params[:data][:user_id]
        jam_id = params[:data][:jam_id]
        Jam.accept_request(user_id, jam_id)
        redirect_to jam_path(jam_id)
    end

    def decline_request
        user_id = params[:data][:user_id]
        jam_id = params[:data][:jam_id]
        Jam.decline_request(user_id, jam_id)
        redirect_to jam_path(jam_id)
    end

    def send_request
        
        @data = params[:data][0]
        @jam = Jam.where(id: @data)
        UserJam.create(user_id: current_user.id, jam_id: @jam[0].id, status: "request")


        @jams = UserJam.where("user_id != ?", current_user.id)
        @jams = @jams.collect{|jam| jam.jam_id}.uniq
        @jams = @jams.map do |jam|
            Jam.where(id: jam)
        end
        redirect_to jams_path
    end

    private 
    def jam_params
        params.require(:jam).permit(:name, :space_id, :genre_ids, :date, :time, :info, :tunes)
    end

    def set_jam
        @jam = Jam.find(params[:id])
    end

end
