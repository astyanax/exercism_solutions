module Raindrops
  FACTORS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }
  def self.convert(n)
    result = FACTORS.select { |k, _| n % k == 0 }.values.join
    result.empty? ? n.to_s : result
  end
end
