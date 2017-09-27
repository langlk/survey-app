#!/usr/bin/env ruby

class Question < ActiveRecord::Base
  belongs_to(:survey)
  validates(:question_text, :survey, :presence => true)
end
