ait = Institution.create!(name: "Asian Institute of Technology")

schools = [
  'School of Engineering & Technology (SET)',
  'School of Environment, Resources and Development (SERD)',
  'School of Management (SOM)'
]

# Create schools and their respective departments
schools.each do |school_name|
  school = School.find_or_create_by(name: school_name) # Will find or create

  case school_name
  when 'School of Engineering & Technology (SET)'
    departments = [
      'Bio-Nano Material Science and Engineering',
      'Civil Engineering',
      'Computer Science',
      'Construction, Engineering and Infrastructure Management',
      'Data Science and Artificial Intelligence',
      'Design and Manufacturing Engineering',
      'Disaster Preparedness, Mitigation and Management',
      'Environmental Engineering and Management',
      'Geotechnical and Earth Resources Engineering',
      'Industrial Engineering & Management',
      'Information & Communications Technologies',
      'Internet of Things (IoT) Systems Engineering',
      'Mechatronics',
      'Mechatronics and Machine Intelligence',
      'Medical Engineering',
      'Microelectronics and Embedded Systems',
      'Professional Master in Data Science and Artificial Intelligence Applications',
      'Remote Sensing and Geographic Information Systems',
      'Structural Engineering',
      'Telecommunications',
      'Transportation Engineering',
      'Water Engineering and Management'
    ]
  when 'School of Environment, Resources and Development (SERD)'
    departments = [
      'AgriBusiness Management',
      'Agricultural Systems & Engineering',
      'Aquaculture and Aquatic Resources Management',
      'Climate Change and Sustainable Development',
      'Department-wide course (DS)',
      'Development Planning Management and Innovation',
      'Development and Sustainability',
      'Food Engineering and Bioprocess Technology',
      'Food Innovation, Nutrition and Health',
      'Gender and Development Studies',
      'Natural Resources Management',
      'Sustainable Energy Transition',
      'Urban Innovation and Sustainability'
    ]
  when 'School of Management (SOM)'
    departments = [
      'Business Administration - MBA',
      'M/MSc Business Analytics & Digital Transformation (one and two years)',
    ]
  end

  # Create departments for the current school
  departments.each do |department_name|
    school.departments.find_or_create_by(name: department_name) # Associate department with school
  end
end
