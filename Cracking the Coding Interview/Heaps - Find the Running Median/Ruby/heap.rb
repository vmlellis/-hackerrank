# https://github.com/kanwei/algorithms/blob/master/lib/containers/heap.rb

class Heap
  attr_reader :size

  def initialize(ary=[], &block)
    @compare_fn = block || lambda { |x, y| (x <=> y) == -1 }
    @next = nil
    @size = 0
    @stored = {}

    ary.each { |n| push(n) } unless ary.empty?
  end

  def push(key, value=key)
    node = Node.new(key, value)
    # Add new node to the left of the @next node
    if @next
      node.right = @next
      node.left = @next.left
      node.left.right = node
      @next.left = node
      if @compare_fn[key, @next.key]
        @next = node
      end
    else
      @next = node
    end
    @size += 1

    arr = []
    w = @next.right
    until w == @next do
      arr << w.value
      w = w.right
    end
    arr << @next.value
    @stored[key] ||= []
    @stored[key] << node
    value
  end

  def pop
    return nil unless @next
    popped = @next
    if @size == 1
      clear
      return popped.value
    end
    # Merge the popped's children into root node
    if @next.child
      @next.child.parent = nil

      # get rid of parent
      sibling = @next.child.right
      until sibling == @next.child
        sibling.parent = nil
        sibling = sibling.right
      end

      # Merge the children into the root. If @next is the only root node, make its child the @next node
      if @next.right == @next
        @next = @next.child
      else
        next_left, next_right = @next.left, @next.right
        current_child = @next.child
        @next.right.left = current_child
        @next.left.right = current_child.right
        current_child.right.left = next_left
        current_child.right = next_right
        @next = @next.right
      end
    else
      @next.left.right = @next.right
      @next.right.left = @next.left
      @next = @next.right
    end
    consolidate

    unless @stored[popped.key].delete(popped)
      raise "Couldn't delete node from stored nodes hash"
    end
    @size -= 1

    popped.value
  end

  def has_key?(key)
    @stored[key] && !@stored[key].empty? ? true : false
  end

  private

  # Node class used internally
  class Node
    attr_accessor :parent, :child, :left, :right, :key, :value, :degree, :marked

    def initialize(key, value)
      @key = key
      @value = value
      @degree = 0
      @marked = false
      @right = self
      @left = self
    end

    def marked?
      @marked == true
    end
  end

  # Makes sure the structure does not contain nodes in the root list with equal degrees
  def consolidate
    roots = []
    root = @next
    min = root
    # find the nodes in the list
    loop do
      roots << root
      root = root.right
      break if root == @next
    end
    degrees = []
    roots.each do |root|
      min = root if @compare_fn[root.key, min.key]
      # check if we need to merge
      if degrees[root.degree].nil?  # no other node with the same degree
        degrees[root.degree] = root
        next
      else  # there is another node with the same degree, consolidate them
        degree = root.degree
        until degrees[degree].nil? do
          other_root_with_degree = degrees[degree]
          if @compare_fn[root.key, other_root_with_degree.key]  # determine which node is the parent, which one is the child
            smaller, larger = root, other_root_with_degree
          else
            smaller, larger = other_root_with_degree, root
          end
          link_nodes(larger, smaller)
          degrees[degree] = nil
          root = smaller
          degree += 1
        end
        degrees[degree] = root
        min = root if min.key == root.key # this fixes a bug with duplicate keys not being in the right order
      end
    end
    @next = min
  end

  def clear
    @next = nil
    @size = 0
    @stored = {}
    nil
  end

  # make node a child of a parent node
  def link_nodes(child, parent)
    # link the child's siblings
    child.left.right = child.right
    child.right.left = child.left

    child.parent = parent

    # if parent doesn't have children, make new child its only child
    if parent.child.nil?
      parent.child = child.right = child.left = child
    else # otherwise insert new child into parent's children list
      current_child = parent.child
      child.left = current_child
      child.right = current_child.right
      current_child.right.left = child
      current_child.right = child
    end
    parent.degree += 1
    child.marked = false
  end
end
