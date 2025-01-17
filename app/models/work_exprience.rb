class WorkExprience < ApplicationRecord
  EMPLOYMENT_TYPE = ["full_time", "part_time", "self_employeed", "freelance", "trainee", "internship"]
  LOCATION_TYPE = [ "onsite", "hybird","remote"]
  belongs_to :user
  validates :company, :start_date, :job_title, :employment_type, :location, :location_type,  presence: true
  validates :employment_type, presence: true, inclusion: {in: EMPLOYMENT_TYPE, message: "not a valid  employment type"  } 
  validates :location_type, presence: true, inclusion: {in: LOCATION_TYPE, message: "not a valid  location type"  } 


  validate :work_exprience_last_date
  validate :work_exprience_end_date_must_be_greater_then
   has_rich_text :description
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
  def count_exprinces_date
   if self.end_date.present?
      start_date = self.start_date
      end_date = self.end_date
    else
      start_date = self.start_date
      end_date = Date.today
    end

    years = end_date.year - start_date.year
    months = end_date.month - start_date.month
    days = end_date.day - start_date.day

    # Adjust for negative days
    if days < 0
      months -= 1
      previous_month = (end_date - end_date.day.days) # Last day of the previous month
      days += previous_month.day
    end

    # Adjust for negative months
    if months < 0
      years -= 1
      months += 12
    end
   return "#{years} years, #{months} months, #{days} days"

 end

end
