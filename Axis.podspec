Pod::Spec.new do |s|
  s.name         = "Axis"
  s.version      = "1.1"
  s.summary      = "Axis is a declarative layout creator"
  s.description  = <<-DESC
                  Axis is a declarative way of laying out subviews. Originally I was really excited about AutoLayout, but in practice I found it frustrating, hard to debug and prone to unexpected behaviour. I moved back to calculating frames, but at times I missed declaring layouts with AutoLayout. That's why I started Axis.
                   DESC

  s.license      = 'BSD'
  s.homepage     = 'https://github.com/mwildeboer/Axis'
  s.author       = { "Menno Wildeboer" => "ome.menno@gmail.com" }
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/mwildeboer/Axis.git", :tag => "1.1" }
  s.source_files = 'Source/*.swift'
end
