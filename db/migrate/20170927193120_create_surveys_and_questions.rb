class CreateSurveysAndQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table(:surveys) do |t|
      t.column(:title, :string)
      t.timestamps
    end

    create_table(:questions) do |t|
      t.column(:question_text, :string)
      t.column(:number, :int)
      t.column(:survey_id, :int)
      t.timestamps
    end
  end
end
