class AddProblemRefToIssues < ActiveRecord::Migration
  def change
    add_reference :issues, :problem, index: true, foreign_key: true
  end
end
