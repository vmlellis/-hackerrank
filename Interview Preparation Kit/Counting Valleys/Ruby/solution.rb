class Solution
  class << self
    def run
      gets
      puts solve(gets.chars)
    end

    def solve(paths)
      step(paths, 0, 0)
    end

    def step(paths, altitude, valleys)
      valleys = 0

      paths.each do |path|
        altitude = calc_altitude(path, altitude)
        valleys += 1 if valley?(path, altitude)
      end

      valleys
    end

    def calc_altitude(path, altitude)
      return altitude + 1 if path.eql?("U")
      return altitude - 1 if path.eql?("D")

      altitude
    end

    def valley?(path, altitude)
      path.eql?("U") && altitude.zero?
    end
  end
end

Solution.run
