class MeetingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(safe_meeting)
    if
      @meeting.save
      users = User.all
      users.each do |u|
        UserMailer.welcome_email(u).deliver
      end
      redirect_to "/meetings/#{@meeting.id}"
    else
      flash['issue'] = 'missing fields'
      redirect_to "/meetings/new"
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  private
    def safe_meeting
      params.require('meeting').permit(:location, :start_time, :date)
    end
end
