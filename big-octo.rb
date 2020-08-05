class Octopus

    attr_reader :fish_arr
    def initialize()
        #@fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
    end

    def sluggish(array)
        fish = ''
        array.each_with_index do |fish1, ind1|
            array[ind1 +1..-1].each do |fish2|
                fish = fish1.length > fish2.length ? fish1 : fish2
            end
        end
        fish
    end

    def dominant(array)
        return array if array.length <= 1
        middle_ind = array.length/2
        left = array.take(middle_ind)
        right = array.drop(middle_ind)
        merge(dominant(left), dominant(right))
    end

    def merge(left, right)
        merged = []
        prc = Proc.new { |num1, num2| num1 <=> num2}
        until left.empty? || right.empty?
            case prc.call(left.first.length, right.first.length)
            when -1
                merged.push(left.shift)
            when 0 
                merged.push(left.shift)
            when 1
                merged.push(right.shift)
            end
        end
        merged.concat(left, right)
    end

    def clever(array)
        fish = array.first
        array[1..-1].each { |fishy| fish = fishy if fishy.length >= fish.length }
        fish
    end

    def slow_dance(direction, array)
        array.each_with_index do |move, ind|
            return ind if direction == move
        end
    end

    def fast_dance(direction, hash)
        hash[direction]
    end

end

o = Octopus.new
fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p o.sluggish(fish_arr)
p o.dominant(fish_arr).last
p o.clever(fish_arr)
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p o.slow_dance("up", tiles_array)
p o.slow_dance("right-down", tiles_array)
tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, 
"left-down" => 5, "left" => 6,  "left-up" => 7}
p o.fast_dance("up", tiles_hash)
p o.fast_dance("right-down", tiles_hash)