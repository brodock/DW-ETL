# To change this template, choose Tools | Templates
# and open the template in the editor.

class Task
  def initialize(model)
    @model = model
    @xpathes = []
    @attributes []
  end

  def << xpath, attribute
    @xpathes << xpath
    @attributes << attribute
  end
end
