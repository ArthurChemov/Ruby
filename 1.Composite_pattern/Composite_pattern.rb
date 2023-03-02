class Component
    def getPrice
        @price || 0
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

    # def composite?
    #   false
    # end
end

class Engine < Component
    def initialize
        super
        setName('Engine')
        setPrice(800)
    end
end

class Body < Component
    def initialize
        super
        setName('Body')
        setPrice(3000)
    end
end

class Tools < Component
    def initialize
        super
        setName('Tools')
        setPrice(4000)
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

    # def composite?
    #   true
    # end

    def getPrice
      results = []
      @children.each { |child| results.append(child.getPrice) }
      "#{results.sum}"
    #   "#{results.join('+')}"
    end
end

class Car < Composite
    def initialize
        super
        setName('BMW')
    end
end

myCar = Car.new

engine = Engine.new
body = Body.new
tools = Tools.new

myCar.add(engine)
myCar.add(body)
myCar.add(tools)

puts "#{myCar.getName} price is #{myCar.getPrice}$"
