class MeetingsController < ApplicationController
  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(safe_meeting)
    @meeting.save
    redirect_to "/meetings"
  end

  def show
  end

  private
    def safe_meeting
      params.require('meeting').permit(:location, :start_time, :end_time)
    end
end
