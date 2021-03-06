class JobApplication < ApplicationRecord
    belongs_to :job
    belongs_to :user
    has_one :proposition
    enum status: { 'pendente de avaliação': 5 , 'aprovado': 10, 'negado': 15 }
end 