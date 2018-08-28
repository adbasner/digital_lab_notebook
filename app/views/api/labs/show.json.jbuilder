# json.partial! 'lab', lab: @lab

json.role @role
json.lab @lab
json.notebook_sections @notebook_sections

# json.array! @notebook_sections do |notebook_section|
#   json.notebook_data notebook_section.notebook_data do |notebook_datum|
#     json.stuff notebook_datum.datum
#   end
# end