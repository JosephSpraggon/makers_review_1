class SchoolReport
  attr_reader :green, :red, :amber, :uncounted

  def initialize
    @red = 0
    @green = 0
    @amber = 0
    @uncounted = 0

    #move these into one hash?
    
  end

  def count_scores(scores)
    
    arr = scores.downcase.split(', ')

    arr.each do |score|
      if score == "green"
        @green += 1
      elsif score == "red"
        @red += 1
      elsif score == "amber"
        @amber += 1
      else
        @uncounted += 1
      end
    end

    "...scores calucalted"

  end

  def display_scores
    display = ""
    if @green > 0
      display += "Green: #{@green}"
    end
    if @red > 0
      display += "\n" + "Red: #{@red}"
    end
    if @amber > 0
      display += "\n" + "Amber: #{@amber}"
    end
    if @uncounted > 0
      display += "\n" +  "Uncounted: #{@uncounted}"
    end
    if @green == 0 && @red == 0 && @amber == 0 && @uncounted == 0
      display = "test results empty"
    end
    display
  end

  def clear_scores
    @red = 0
    @green = 0
    @amber = 0
    @uncounted = 0
    "test results wiped clean"
  end

end