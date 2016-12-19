class Instructor::SectionsController < ApplicationController
  def new
    @course = current_course
    @section = Section.new
  end

  def create
    @course = current_course
    @section = @course.sections.create(section_params)
    redirect_to instructor_course_path(@course)
  end

  private

  helper_method :current_course
  def current_course
    @course ||= Course.find(params[:course_id])
  end

  def section_params
    params.require(:section).permit(:title)
  end
  
end
