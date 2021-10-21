class TimetablesController < InheritedResources::Base

  private

    def timetable_params
      params.require(:timetable).permit(:hospital_speciality_id, :day, :start_hour, :end_hour)
    end

end
