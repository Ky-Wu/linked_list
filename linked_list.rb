class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append(node_value)
    n = Node.new(node_value)
    unless empty?
      @tail.next_node = n
      @tail = n
    else
      set_only_node(n)
    end
  end

  def prepend(node_value)
    n = Node.new(node_value)
    unless empty?
      n.next_node = @head
      @head = n
    else
      set_only_node(n)
    end
  end

  def size
    counter = 0
    current_node = @head
    until current_node.nil?
      counter += 1
      current_node = current_node.next_node
    end
    counter
  end

  def at(index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
      break if current_node == nil
    end
    if current_node.nil?
      return nil
    else
      current_node.value
    end
  end

  def pop
    #Store second to last element's index in the variable n
    n = size - 2
    current_node = @head
    n.times { current_node = current_node.next_node }
    current_node.next_node = nil
    @tail = current_node
  end

  def contains?(value)
    current_node = @head
    until current_node.nil?
      return true if current_node.value == value
    end
    false
  end

  def find(data)
    current_node = @head
    index = 0
    until current_node == nil
      return index if current_node.value == data
      current_node = current_node.next_node
      index += 1
    end
    return nil
  end

  def to_s
    data = []
    current_node = @head
    until current_node.nil?
      data << current_node.value.to_s
      current_node = current_node.next_node
    end
    output = ""
    data.each { |item| output << "( #{item} ) -> "}
    output << "nil"
    output
  end

  def tail
    if @tail.nil?
      nil
    else
      @tail.value
    end
  end

  def head
    if @head.nil?
      nil
    else
      @head.value
    end
  end

  private

  def empty?
    if @head.nil? and @tail.nil?
      return true
    else
      return false
    end
  end

  def set_only_node(n)
    @head = n
    @tail = n
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end
