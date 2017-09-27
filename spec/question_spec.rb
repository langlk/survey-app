#!/usr/bin/env ruby

require "spec_helper"

describe('Question') do
  describe '#save' do
    it "does not allow blank question" do
      question = Question.new({question_text: "", number: 0, survey_id: nil})
      expect(question.save).to eq(false)
    end

    it "does not allow a question to be assigned to a survey that doesn't exist" do
      survey = Survey.create({title: "Favorite Gems"})
      question = Question.new({question_text: "Who is your favorite Crystal Gem?", number: 1, survey_id: (survey.id + 1)})
      expect(question.save).to eq(false)
    end
  end

  describe '#survey' do
    it "returns the survey a question is a part of" do
      survey = Survey.create({title: "Favorite Gems"})
      question1 = Question.create({question_text: "Who is your favorite Crystal Gem?", number: 1, survey_id: survey.id})
      expect(question1.survey).to eq(survey)
    end
  end
end
