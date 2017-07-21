class SlowFile
  def initialize(filename)
    @file = File.new(filename)
  end

  def each
    loop do
      chunk = @file.read(1024)
      break if chunk.nil?
      sleep 0.02
      yield chunk
    end
  end
end

run ->(env) {
  [200, {}, SlowFile.new("public#{env['PATH_INFO']}")]
}
