class EmprestimosRealizados < ActiveRecord::Base
  belongs_to :emprestimo
  belongs_to :dpu
end
