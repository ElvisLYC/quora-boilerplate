furniture = [
  {"name" => "bed", "color" => "black", "size" => "12", "date_created" => "12/6", "condition" => "New"},
  {"name" => "chair", "color" => "brown", "size" => "7", "date_created" => "6/13", "condition" => "Used"},
  {"name" => "desk", "color" => "maple", "size" => "9", "date_created" => "2/13", "condition" => "New"}
]


p furniture.map {|x| x.values[1]}

# question = Question.all
# @question = question.map{|x| param[:x.values][1]}


p 123.to_s
