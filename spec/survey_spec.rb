#!/usr/bin/env ruby

require 'spec_helper'

describe('Survey') do
  describe '#save' do
    it "does not allow the title to be blank" do
      survey = Survey.new({title: ""})
      expect(survey.save).to eq(false)
    end
  end

  describe '#questions' do
    it "returns a list of all questions in the survey" do
      survey = Survey.create({title: "Favorite Gems"})
      question1 = Question.create({question_text: "Who is your favorite Crystal Gem?", number: 1, survey_id: survey.id})
      question2 = Question.create({question_text: "Who is your favorite Homeworld Gem?", number: 2, survey_id: survey.id})
      expect(survey.questions).to eq([question1, question2])
    end
  end

  describe '.create' do
    it "capitalizes the first letter of each word in the survey title" do
      survey = Survey.create({title: "steven UNIVERSE fan survey"})
      expect(survey.title).to eq('Steven Universe Fan Survey')
    end
  end
end
