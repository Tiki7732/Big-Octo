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

end

o = Octopus.new
fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p o.sluggish(fish_arr)
p o.dominant(fish_arr).last
