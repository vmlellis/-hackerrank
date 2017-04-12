@history = {}

def fibonacci(n)
  return n if [0, 1].include?(n)
  @history[n - 1] ||= fibonacci(n - 1)
  @history[n - 2] ||= fibonacci(n - 2)
  @history[n - 1] + @history[n - 2]
end

n = gets.to_i
print(fibonacci(n))
