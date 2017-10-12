require 'nokogiri'
require 'open-uri'
require 'csv'

urls = Array['http://catalog.hunter.cuny.edu/content.php?catoid=32&navoid=7961',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=2#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=3#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=4#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=5#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=6#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=7#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=8#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=9#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=10#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=11#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=12#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=13#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=14#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=15#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=16#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=17#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=18#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=19#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=20#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=21#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=22#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=23#acalog_template_course_filter',
            'http://catalog.hunter.cuny.edu/content.php?catoid=32&catoid=32&navoid=7961&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=24#acalog_template_course_filter']




@courses = Array.new
@subjects = Array.new
urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css('td>a').each do |course|
      @courses << course.content
    end




doc.css('strong').each do |subject|
  @subjects << subject.content
end


CSV.open("courses.csv", "wb") do |row|
  row << @courses
end
CSV.open("hi.csv", "wb") do |row|
  row << @subjects
end
end
