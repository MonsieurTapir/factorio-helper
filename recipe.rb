class Recipe
  attr_accessor :name,:duration,:ingredients,:produces,:category,:production_rate
  
  # Constructor from string describing a recipe using format
  # <name>@<category>@<duration>@<quantity1>:<product1>,<quantity2>:<product2>...@<quantity1>:<ingredient1>,<quantity2>:<ingredient2>...
  def initialize(s)
    self.produces={}
    self.ingredients={}
    result_factor=1
    
    name,category,duration,production,ingredients=s.split("@")
    
    production.split(",").each{|x|
      a,b=x.split(":")
      self.produces[b]=a.to_i
      result_factor=a.to_i # assuming the recipe produces 1 product exactly....
    }
    
    ingredients.split(",").each{|x|
      a,b=x.split(":")
      self.ingredients[b]=a.to_f
    }
    self.duration=duration.to_f
    self.production_rate=result_factor/(self.duration)
    self.name=name
    if category.include? "crafting"
      category="crafting"
    end    
    self.category=category
  end
end

class DrillingRecipe < Recipe
  attr_accessor :hardness
  def initialize(s)
    super s
    self.hardness=self.ingredients["hardness"]
    self.ingredients={}
  end
end
