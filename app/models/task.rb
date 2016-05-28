class Task < ActiveRecord::Base
  def completed?
    completed_at?
  end
end
