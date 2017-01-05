class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrolled_for_current_lesson

  def show
  end

  private
  
  def require_enrolled_for_current_lesson
    alert_message = "WARNING. You may not view " << current_lesson.title << ". You are not enrolled in the course!"
    if !current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course), alert: alert_message
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end
