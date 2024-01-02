require "irb/completion"

major, minor, _ = RUBY_VERSION.split(".")

require "irb/ext/save-history" if major.to_i >= 3 && minor.to_i < 3

IRB.conf[:EVAL_HISTORY] = 1_000
IRB.conf[:SAVE_HISTORY] = 1_000
IRB.conf[:HISTORY_FILE] = "#{ENV["HOME"]}/.irb-history"
