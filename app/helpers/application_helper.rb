module ApplicationHelper
  def favorite?(comment_id)
    Favorite.find_by(user_id: current_user.id, comment_id: comment_id).present?
  end

  def get_favorite(comment_id)
    Favorite.find_by(user_id: current_user.id, comment_id:comment_id)
  end

  def get_hospital_speciality(hospital_id, speciality_id)
    HospitalSpeciality.find_by(hospital_id: hospital_id, speciality_id: speciality_id)
  end

  def destroy_admin
    # current_user.destroy
    redirect_to hospitals_path
  end

  def get_day(day)
    if day==1
      day = "Lundi"
    elsif day==2
      day = "Mardi"
    elsif day==3
      day = "Mercredi"
    elsif day==4
      day = "Jeudi"
    elsif day==5
      day = "Vendredi"
    elsif day==6
      day = "Samedi"
    elsif day==7
      day = "Dimanche"
    end

    return day
  end
end
