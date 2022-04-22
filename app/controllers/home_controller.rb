class HomeController < ApplicationController
  def index
    @employees = Employee.all
    @departments = Department.all
    @floors = Floor.all

    @todays_birthdays = Employee.todays_birthdays.sort
    @upcoming_birthdays = Employee.upcoming_birthdays.order('date_of_birth ASC')
  end
end
