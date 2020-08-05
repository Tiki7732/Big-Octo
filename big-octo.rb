class Octopus

    attr_reader :fish_arr
    def initialize()
        @fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
    end

    def sluggish
        fish = ''
        @fish_arr.each_with_index do |fish1, ind1|
            @fish_arr[ind1 +1..-1].each do |fish2|
                fish = fish1.length > fish2.length ? fish1 : fish2
            end
        end
        fish
    end
end

o = Octopus.new
p o.sluggish