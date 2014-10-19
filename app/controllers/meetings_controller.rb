class MeetingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :authenticate_entrepreneur!, only: [:show]

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

  def join
    @meeting = Meeting.find(params[:id])
    @meeting.entrepreneurs << current_entrepreneur
    @meeting.save
    redirect_to "/meetings/#{@meeting.id}"
  end

  def leave
    @meeting = Meeting.find(params[:id])
    @meeting.entrepreneurs.delete(current_entrepreneur)
    @meeting.save
    redirect_to "/meetings/#{@meeting.id}"
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def add
    @entrepreneur = Entrepreneur.find_by_email(params[:email])
    @meeting = Meeting.find(params[:id])
    @meeting.entrepreneurs << @entrepreneur
    redirect_to "/meetings/#{@meeting.id}/edit"
  end

  def next
    @meeting = Meeting.last
    if @meeting
      redirect_to "/meetings/#{@meeting.id}"
    else
      redirect_to "/meetings/new"
    end
  end

  private
    def safe_meeting
      params[:meeting][:date] = params[:meeting][:date].slice(6,4)+"/"+params[:meeting][:date].slice(0,2)+"/"+params[:meeting][:date].slice(3,2)
      params.require('meeting').permit(:location, :start_time, :date)
    end
end
