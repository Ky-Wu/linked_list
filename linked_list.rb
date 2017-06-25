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
    node_value
  end

  def prepend(node_value)
    n = Node.new(node_value)
    unless empty?
      n.next_node = @head
      @head = n
    else
      set_only_node(n)
    end
    node_value
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
    node = node_at(index)
    return node.value unless node == nil
    nil
  end

  def pop
    #Store second to last element's index in the variable n
    n = size - 2
    second_to_last_node = node_at(n)
    second_to_last_node.value = nil
    @tail = second_to_last_node
  end

  def contains?(value)
    iterate { |node| return true if current_node.value == value }
    false
  end

  def find(data)
    index = 0
    iterate do |node|
      return index if current_node.value == data
      index += 1
    end
    nil
  end

  def to_s
    data = []
    iterate do |node|
      next if node.nil?
      if node.value.nil?
        data << "nil"
      else
        data << node.value.to_s
      end
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

  def insert_at(index, node_value)
    set_only_node(Node.new) if empty?
    current_node = @head
    index.times do
      current_node.next_node = Node.new if current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node.value = node_value
  end

  def remove_at(index)
    max_index = size - 1
    if index == 0
      @head = @head.next_node
      @tail = nil if max_index == 0
    elsif index == max_index
      second_to_last_node = node_at(index - 1)
      second_to_last_node.next_node = nil
      @tail = second_to_last_node
    elsif index > 0 and index < max_index
      previous_node = node_at(index - 1)
      previous_node.next_node = previous_node.next_node.next_node
    end
  end

  private

  def node_at(index)
    current_node = @head
    index.times do
      break if current_node == nil
      current_node = current_node.next_node
    end
    if current_node.nil?
      return nil
    else
      current_node
    end
  end

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

  def iterate
    current_node = @head
    until current_node == nil
      yield(current_node)
      current_node = current_node.next_node
    end
  end

end

class Node
  attr_accessor :value, :next_node
  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

#Refactoring is very possible here. Try using that private method that returns a node at a specific index.
