#!/usr/bin/env ruby

class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many(:answers)
  validates(:question_text, :survey, :presence => true)
end
