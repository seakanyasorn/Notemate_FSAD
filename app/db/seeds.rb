# ait = Institution.create!(name: "Asian Institute of Technology")

# schools = [
#   'School of Engineering & Technology (SET)',
#   'School of Environment, Resources and Development (SERD)',
#   'School of Management (SOM)'
# ]

# # Create schools and their respective departments
# schools.each do |school_name|
#   school = School.find_or_create_by(name: school_name) # Will find or create

#   case school_name
#   when 'School of Engineering & Technology (SET)'
#     departments = [
#       'Bio-Nano Material Science and Engineering',
#       'Civil Engineering',
#       'Computer Science',
#       'Construction, Engineering and Infrastructure Management',
#       'Data Science and Artificial Intelligence',
#       'Design and Manufacturing Engineering',
#       'Disaster Preparedness, Mitigation and Management',
#       'Environmental Engineering and Management',
#       'Geotechnical and Earth Resources Engineering',
#       'Industrial Engineering & Management',
#       'Information & Communications Technologies',
#       'Internet of Things (IoT) Systems Engineering',
#       'Mechatronics',
#       'Mechatronics and Machine Intelligence',
#       'Medical Engineering',
#       'Microelectronics and Embedded Systems',
#       'Professional Master in Data Science and Artificial Intelligence Applications',
#       'Remote Sensing and Geographic Information Systems',
#       'Structural Engineering',
#       'Telecommunications',
#       'Transportation Engineering',
#       'Water Engineering and Management'
#     ]
#   when 'School of Environment, Resources and Development (SERD)'
#     departments = [
#       'AgriBusiness Management',
#       'Agricultural Systems & Engineering',
#       'Aquaculture and Aquatic Resources Management',
#       'Climate Change and Sustainable Development',
#       'Department-wide course (DS)',
#       'Development Planning Management and Innovation',
#       'Development and Sustainability',
#       'Food Engineering and Bioprocess Technology',
#       'Food Innovation, Nutrition and Health',
#       'Gender and Development Studies',
#       'Natural Resources Management',
#       'Sustainable Energy Transition',
#       'Urban Innovation and Sustainability'
#     ]
#   when 'School of Management (SOM)'
#     departments = [
#       'Business Administration - MBA',
#       'M/MSc Business Analytics & Digital Transformation (one and two years)',
#     ]
#   end

#   # Create departments for the current school
#   departments.each do |department_name|
#     school.departments.find_or_create_by(name: department_name) # Associate department with school
#   end
# end
# Seed institutions
ait = Institution.find_or_create_by(name: "Asian Institute of Technology")

# Define the schools and departments
schools = {
  'School of Engineering & Technology (SET)' => [
    { name: 'Bio-Nano Material Science and Engineering', subjects: [
      'Nano-Micro Fabrication Technologies',
      'Nanomaterials and Nanotechnology'
    ]},
    { name: 'Civil Engineering', subjects: [
      'Structural Dynamics for Tall Buildings',
      'Earthquake Engineering for Tall Buildings',
      'Wind Engineering for Tall Buildings',
      'Geotechnical Engineering for Tall Buildings',
      'Construction Technology and Management for Tall Buildings Projects',
      'Performance Based Seismic Design',
      'Structural Health Evaluation and Monitoring of Buildings'
    ]},
    { name: 'Computer Science', subjects: [
      'Theory of Computing',
      'Computer Networks',
      'Full Stack Application Development'
    ]},
    { name: 'Construction, Engineering and Infrastructure Management', subjects: [
      'Project Cost and Financial Management',
      'Organizational Management in Construction',
      'Research Methodology in the Built Environment',
      'Integrated Project Planning and Control',
      'Communication and Negotiation Skills for Project Managers'
    ]},
    { name: 'Data Science and Artificial Intelligence', subjects: [
      'Computer Programming for Data Science and Artificial Intelligence',
      'Data Modeling and Management',
      'Machine Learning',
      'Artificial Intelligence: Knowledge Representation and Reasoning',
      'Computer Vision',
      'Human-Computer Interaction and Information Visualization'
    ]},
    { name: 'Design and Manufacturing Engineering', subjects: [
      'Additive Manufacturing and Reverse Engineering',
      'Communications and People Skills Development for Engineering Leaders'
    ]},
    { name: 'Disaster Preparedness, Mitigation and Management', subjects: [
      'Managing Disasters',
      'Remote Sensing and GIS for Disaster Mitigation',
      'Human Conflicts and Humanitarian Emergency Management'
    ]},
    { name: 'Environmental Engineering and Management', subjects: [
      'Environmental Chemistry & Laboratory',
      'Solid Waste Management',
      'Wastewater Treatment',
      'Drinking Water Treatment',
      'Air Pollution Engineering and Management'
    ]},
    { name: 'Geotechnical and Earth Resources Engineering', subjects: [
      'Rock Mechanics',
      'Advanced Soil Mechanics and Testings',
      'Engineering Geology',
      'Soil Dynamics and Earthquake Engineering',
      'Drilling & Well Completion Operation',
      'Petroleum Production Engineering'
    ]},
    { name: 'Industrial Engineering & Management', subjects: [
      'Deterministic Optimization Models',
      'Statistical Models and Design of Experiments',
      'Supply Chain Management'
    ]},
    { name: 'Information & Communications Technologies', subjects: [
      'Information and Communication Technology Applications: Users and Producers'
    ]},
    { name: 'Information Management', subjects: [
      'E-Business Development and Technology'
    ]},
    { name: 'Internet of Things (IoT) Systems Engineering', subjects: [
      'Wireless Technologies for Internet of Things'
    ]},
    { name: 'Mechatronics', subjects: [
      'Kinematics and Dynamics of Mechanisms and Robots',
      'AI and Neuro-Fuzzy Theory',
      'Control Theory'
    ]},
    { name: 'Mechatronics and Machine Intelligence', subjects: [
      'Deep Learning for Computer Vision'
    ]},
    { name: 'Medical Engineering', subjects: [
      'Biomaterials for Medical Engineers'
    ]},
    { name: 'Microelectronics and Embedded Systems', subjects: [
      'Embedded Systems Design'
    ]},
    { name: 'Professional Master in Data Science and Artificial Intelligence Applications', subjects: [
      'Computer Programming for Data Science',
      'Data Modeling and Data Management',
      'Fundamentals of Machine Learning',
      'Data Analytics for Business Intelligence'
    ]},
    { name: 'Remote Sensing and Geographic Information Systems', subjects: [
      'Geographic Information Systems',
      'Remote Sensing',
      'Web GIS Technology',
      'Positioning and Location Based Services Technology'
    ]},
    { name: 'Structural Engineering', subjects: [
      'Computer Methods of Structural Analysis',
      'Structural Dynamics',
      'Advanced Concrete Technology',
      'Advanced Concrete Structures'
    ]},
    { name: 'Telecommunications', subjects: [
      'Signals, Systems and Stochastic Processes',
      'Data Communications',
      'Optimization for Communications and Networks'
    ]},
    { name: 'Transportation Engineering', subjects: [
      'Transportation Systems',
      'Transportation Planning Methods and Analysis',
      'Transportation Demand Modeling and Forecasting',
      'Traffic System Analysis and Control'
    ]},
    { name: 'Water Engineering and Management', subjects: [
      'Watershed Hydrology',
      'Hydrodynamics',
      'Water Resources Systems',
      'Concepts in Water Modeling',
      'Irrigation and Drainage Engineering'      
    ]}
  ]
}

# Create schools, departments, and subjects
schools.each do |school_name, departments|
  school = School.find_or_create_by(name: school_name)
  
  departments.each do |department_data|
    department = school.departments.find_or_create_by(name: department_data[:name])

    department_data[:subjects].each do |subject_name|
      department.subjects.find_or_create_by(
        name: subject_name,
        institution: ait  # Associate the subject with the institution
      )
    end
  end
end
