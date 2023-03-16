class Component
  def getPrice
    @price
  end

  def getName
    @name
  end

  def setName(name)
    @name = name
  end

  def setPrice(price)
    @price = price
  end

end

class Engine < Component
  attr_accessor :engine
  def initialize(engine)
    super()
    setName('Engine')
    setPrice(engine)
  end
end

class Body < Component
  attr_accessor :body
  def initialize(body)
    super()
    setName('Body')
    setPrice(body)
  end
end

class Tools < Component
  attr_accessor :tools
  def initialize(tools)
    super()
    setName('Tools')
    setPrice(tools)
  end
end

class Composite < Component
  def initialize
    super
    @children = []
  end

  def add(component)
    @children.append(component)
  end

  def remove(component)
    @children.remove(component)
  end

  def getPrice
    results = []
    @children.each { |child| results.append(child.getPrice) }
    "#{results.sum}"
  end
end

class Car < Composite
  attr_accessor :car
  def initialize(car)
    super()
    setName(car)
  end
end

myCar = Car.new('BMW')

engine = Engine.new(1000)
body = Body.new(4000)
tools = Tools.new(2000)

myCar.add(engine)
myCar.add(body)
myCar.add(tools)

puts "#{myCar.getName} price is #{myCar.getPrice}$"
