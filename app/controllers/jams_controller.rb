class JamsController < ApplicationController


    before_action :set_jam, only: [:show, :update, :destroy]

    def index

    end

    def show
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

    end
    
    def destroy

    end

    private 
    def jam_params
        params.require(:jam).permit(:name, :space_id, {:genre_ids => []}, :date, :time, :info, :tunes)
    end

    def set_jam
        @jam = Jam.find(params[:id])
    end

end
