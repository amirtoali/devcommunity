class WorkExprience < ApplicationRecord
  EMPLOYMENT_TYPE = ["full_time", "part_time", "self_employeed", "freelance", "trainee", "internship"]
  LOCATION_TYPE = [ "onsite", "hybird","remote"]
  belongs_to :user
  validates :company, :start_date, :job_title, :employment_type, :location, :location_type,  presence: true
  validates :employment_type, presence: true, inclusion: {in: EMPLOYMENT_TYPE, message: "not a valid  employment type"  } 
  validates :location_type, presence: true, inclusion: {in: LOCATION_TYPE, message: "not a valid  location type"  } 


  validate :work_exprience_last_date
  validate :work_exprience_end_date_must_be_greater_then

  def work_exprience_last_date
    if end_date.present? && currently_working_here.present?
     errors.add(:end_date, "must be blank if you work here ")
    elsif end_date.nil? && currently_working_here.nil? 
      errors.add(:end_date, "must be present")
    end
  end
  def work_exprience_end_date_must_be_greater_then
    if end_date.present? && start_date > end_date
      errors.add(:end_date, "must be greater then start date")
    end
  end


end
