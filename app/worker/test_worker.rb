# app/workers/test_worker
require "colorize"

class TestWorker
  include Sidekiq::Worker

  def perform(name, count)
    puts "HardWorker is performing".red
    count.times do
      puts "...Hello #{name}".green
    end
  end
end
