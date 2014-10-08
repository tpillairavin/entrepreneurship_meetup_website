class MeetingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(safe_meeting)
    if
      @meeting.save
      redirect_to "/meetings/show"
    else
      flash['issue'] = 'missing fields'
      redirect_to "/meetings/new"
    end
  end

  def show
    @meetings = Meeting.all
  end

  private
    def safe_meeting
      params.require('meeting').permit(:location, :start_time)
    end
end
