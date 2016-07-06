class TimeEntry < ApplicationRecord

  belongs_to :project



  # the_entry = TimeEntry.create(
  #   hours: 1,
  #   minutes: 45,
  #   comments: "Did stuff",
  #   date: Time.now,
  #   project_id: 1
  #   )




end
