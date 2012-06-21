#!/usr/bin/env ruby

# checkout the readme from the master branch
`git checkout gh-pages; git checkout master README.md`

path = `pwd`.gsub(/\n/, "")
readme_path = File.join(path, "README.md")
index_path = File.join(path, "index.md")

# write the index readme file
# be sure to prepend the jekyll front matter
File.open readme_path, "r" do |readme|
  File.open index_path, "w" do |index|
    text = readme.readlines.join
    %w(bash ruby).each do |lang|
      text = text.gsub("```#{lang}", "{% highlight #{lang} %}")
    end
    text = text.gsub("```", "{% endhighlight %}")
    index.puts "---"
    index.puts "layout: main"
    index.puts "---"
    index.puts text
  end
end

# remove the readme
`git rm -f README.md`
