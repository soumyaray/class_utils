class ClassList
  attr_reader :students

  DICT_HEADERS = {
    '學號' => :id,
    '中文姓名' => :name_zh,
    '英文姓名' => :name_en,
    '科系班別碼' => :dept_id,
    '科系班別中文' => :dept_zh,
    '註記' => :note,
    '電子郵件' => :email,
    '加選方式' => :info
  }

  def initialize(filename)
    file = File.read(filename, encoding: 'Big5').encode('utf-8')
    @students = parse_roster_file(file)
  end

  private

  def parse_roster_file(file)
    lines = file.split("\n").map { |l| l.split(',') }
    headers = lines.first.map{ |h| DICT_HEADERS[h] || 'NA'}
    lines[1..-1].map { |student_info| headers.zip(student_info).to_h }
  end
end
