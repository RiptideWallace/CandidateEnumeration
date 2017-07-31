# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidate.each do |candidate|
    if candidate[:id] == id
      pp candidate
    else
      nil
    end
  end
end

def experienced?(candidate)
  if candidate[:years_of_experience] >= 2
    @experienced = true
  else
    @experienced = false
  end
end

def ordered_by_qualifications(candidates)
  pp candidates.sort_by{ |candidate| [candidate[:years_of_experience], candidate[:github_points]]}
end

def qualified_candidates(candidates)
  candidates.each do |candidate|
    if experienced?(candidate) && github_points?(candidate) && ruby_python?(candidate) && age_over_17?(candidate) && application_date?(candidate)
      pp candidate
    end
  end
end

def github_points?(candidate)
  if candidate[:github_points] >= 100
    @check = true
  else
    @check = false
  end
end

def ruby_python?(candidate)
  if candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
    @check = true
  else
    @check = false
  end
end

def age_over_17?(candidate)
  if candidate[:age] > 17
    @check = true
  else
    @check = false
  end
end

def application_date?(candidate)
  if (candidate[:date_applied][0].to_i <= 15)
    @check = true
  else
    @check = false
  end
end



