class TimeEntry < ApplicationRecord

  belongs_to :project

  validates :hours, presence: true, numericality: { only_integer: true }
  validates :minutes, presence: true, numericality: { only_integer: true }
  validates :date, presence:true
  validates_associated :project
  # the_entry = TimeEntry.create(
  #   hours: 1,
  #   minutes: 45,
  #   comments: "Did stuff",
  #   date: Time.now,
  #   project_id: 1
  #   )




end
