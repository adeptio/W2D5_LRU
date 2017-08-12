require 'byebug'

class Node

  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    # debugger
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil
    self.prev = nil
    self
  end

end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    each do |node|
      if node.key == key
        return true
      end
    end

    false
  end

  def append(key, val)
          # debugger
    new_node = Node.new(key, val)
    old_prev = @tail.prev
    @tail.prev = new_node
    old_prev.next = new_node
    new_node.next = @tail
    new_node.prev = old_prev
    # @tail.prev.next = new_node
    # new_node.prev = @tail.prev.next
    # @tail.prev = new_node
    # new_node.next = @tail
  end

  def update(key, val)
    each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.remove
      end
    end
    nil
  end

  def each(&prc)
    curr = @head.next

    while curr != nil
      # debugger
      prc.call(curr) unless curr.val.nil?

      curr = curr.next
    end

    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
