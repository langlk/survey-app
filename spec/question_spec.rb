#!/usr/bin/env ruby

require "spec_helper"

describe('Question') do
  describe '#survey' do
    it "returns the survey a question is a part of" do
      survey = Survey.create({title: "Favorite Gems"})
      question1 = Question.create({question_text: "Who is your favorite Crystal Gem?", number: 1, survey_id: survey.id})
      expect(question1.survey).to eq(survey)
    end
  end
end
