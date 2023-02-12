require "csv"
require "json"
# print 'Enter a csv file to print:'
# filename = gets.chomp

# csv = CSV.open("CPL.csv", 'r')
# csv.read
cpl = {}

csv = CSV.read("cpl.csv")
# exclude headers in first row
csv.shift
csv.each { |row|
  if cpl[row[3]].nil?
    cpl[row[3]] = {}
  end

  if cpl[row[3]][row[4]].nil?
    cpl[row[3]][row[4]] = {}
  end

  if cpl[row[3]][row[4]][row[8]].nil?
    cpl[row[3]][row[4]][row[8]] = {}
  end
}

puts cpl.to_json
