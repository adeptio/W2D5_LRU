class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash = 0

    self.each_with_index do |el, idx|
      hash += (el.hash + idx.hash) % 20
    end

    hash
  end
end

class String
  def hash
    new_hash = 0
    self.chars.each_with_index do |ch, i|
      new_hash += (ch.ord + i).hash
    end
    new_hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    new_hash = 0
    self.each do |k, v|
      new_hash += (k.to_s.ord + v.ord)
    end
    new_hash
  end
end
