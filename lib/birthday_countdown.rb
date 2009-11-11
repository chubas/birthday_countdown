# BirthdayCountdown

module BirthdayCountdown

  # Common idiom for keeping instance and class methods separate
  def self.included(base)
    base.class_eval do
      include InstanceMethods
      extend ClassMethods
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    def days_to_birthday
      today     = Date.today
      birthday  = self.birthday   # The model requires a field :birthday, that returns a date
      next_bday = Date.new(today.year, birthday.month, birthday.day)
      if today > next_bday  # If it was before, in this year, set it the next year
        next_bday = Date.new(today.year + 1, birthday.month, birthday.day)
      end
      return (next_bday - today).to_i
    end
  end

end

