class HomeController < ApplicationController
  def index
    @employees = Employee.all
    @departments = Department.all
    @floors = Floor.all
  end

  def about
  end
end
