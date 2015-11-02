class RemoveProblemFromIssues < ActiveRecord::Migration
  def change
    remove_reference :issues, :problem, index: true, foreign_key: true
  end
end
