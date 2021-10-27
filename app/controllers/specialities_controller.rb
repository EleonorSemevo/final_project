class SpecialitiesController < ApplicationController
  before_action :set_speciality, only: %i[ show edit update destroy ]
end
