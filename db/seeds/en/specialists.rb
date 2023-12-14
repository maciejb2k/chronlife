Rails.logger.debug "Seeding specialists and articles ..."

FIELDS_OF_EXPERTISE = [
  "Allergy",
  "Angiology",
  "Audiology",
  "Balneology",
  "Surgery",
  "Respiratory diseases",
  "Internal medicine",
  "Infectious diseases",
  "Dermatology",
  "Diabetes",
  "Endocrinology",
  "Epidemiology",
  "Pharmacology",
  "Gastroenterology",
  "Geriatrics",
  "Gynecology",
  "Hematology",
  "Hypertension",
  "Immunology",
  "Cardiosurgery",
  "Cardiology",
  "Sports medicine",
  "Microbiology",
  "Nephrology",
  "Neonatology",
  "Neurosurgery",
  "Neurology",
  "Neuropathology",
  "Ophthalmology",
  "Oncology",
  "Orthopedics",
  "Otorhinolaryngology",
  "Pathomorphology",
  "Pediatrics",
  "Perinatology",
  "Obstetrics",
  "Psychiatry",
  "Radiology",
  "Radiotherapy",
  "Rheumatology",
  "Toxicology",
  "Transfusion medicine",
  "Transplantation",
  "Urology"
].freeze

SPECIALIZATIONS = {
  Allergy: ["allergist"],
  Angiology: ["angiologist"],
  Audiology: %w[audiologist phoniatrics],
  Balneotology: ["balneologist", "physical medicine"],
  Surgery: [
    "pediatric surgeon",
    "thoracic surgeon",
    "vascular surgeon",
    "general surgeon",
    "oncological surgeon",
    "plastic surgeon",
    "oral and maxillofacial surgeon"
  ],
  "Respiratory diseases": ["pulmonologist"],
  "Internal medicine": ["internist"],
  "Infectious diseases": ["infectious disease specialist", "epidemiologist"],
  Dermatology: %w[dermatologist venereologist],
  Diabetes: ["pediatric diabetologist"],
  Endocrinology: ["pediatric endocrinologist"],
  Epidemiology: ["pediatric epidemiologist"],
  Pharmacology: ["clinical pharmacologist"],
  Gastroenterology: ["pediatric gastroenterologist"],
  Geriatrics: ["geriatrics", "clinical geriatrics"],
  Gynecology: ["gynecologist", "pediatric obstetrician"],
  Hematology: ["hematologist", "pediatric hematologist"],
  Hypertension: ["hypertension specialist", "pediatric hypertension specialist"],
  Immunology: ["clinical immunologist"],
  Cardiosurgery: ["clinical cardiac surgeon", "pediatric cardiac surgeon", "general cardiac surgeon"],
  Cardiology: ["cardiologist", "pediatric cardiologist"],
  "Sports medicine": ["sports medicine"],
  Microbiology: ["medical microbiologist"],
  Nephrology: ["clinical nephrologist"],
  Neonatology: ["clinical neonatologist"],
  Neurosurgery: ["clinical neurosurgeon"],
  Neurology: ["pediatric neurologist"],
  Neuropathology: ["clinical neuropathologist"],
  Ophthalmology: ["pediatric ophthalmologist", "clinical ophthalmologist"],
  Oncology: [
    "oncologist",
    "pediatric hemato-oncologist",
    "clinical oncologist"
  ],
  Orthopedics: ["orthopedist", "orthopedic traumatologist"],
  Otorhinolaryngology: ["otolaryngologist", "pediatric otolaryngologist"],
  Pathology: ["pediatric pathologist"],
  Pediatrics: ["pediatrician"],
  Perinatology: ["pediatric perinatologist"],
  Obstetrics: ["pediatric obstetrician"],
  Psychiatry: ["pediatric psychiatrist"],
  Radiology: ["radiologist", "medical imaging specialist"],
  Radiotherapy: ["oncological radiotherapist"],
  Rheumatology: ["pediatric rheumatologist"],
  Toxicology: ["clinical toxicologist"],
  "Transfusion medicine": ["clinical transfusion medicine specialist"],
  Transplantation: ["clinical transplantation specialist"],
  Urology: ["urologist"]
}.freeze

8.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = "#{first_name}#{last_name}".downcase

  user = User.new(
    email: "#{first_name}.#{last_name}@gov",
    password: "password",
    password_confirmation: "password",
    tos_agreement: true
  )
  user.skip_confirmation!

  field_of_expertise = FIELDS_OF_EXPERTISE.sample
  specialization = SPECIALIZATIONS[field_of_expertise.to_sym].sample

  user.build_specialist(
    field_of_expertise:,
    specialization:,
    specialization_description: "-"
  )

  user.set_specialist_role!
  user.save!

  account = user.build_account(
    first_name:,
    last_name:,
    username:
  )

  account.save!
end

Article.create!(
  title: "Healthy Sleep Habits",
  description: "An introduction to good sleep practices and their impact on overall health.",
  body: "<p>Sleep plays a key role in our overall health. It is during sleep that our bodies repair and undergo essential repair processes. It is therefore worth taking care of healthy sleep habits that will help us enjoy better health and well-being.</p><p><br></p><p>Here are a few simple rules to follow:</p><p><br></p><p>1. Regularity: Try to go to bed and wake up at the same times, even on weekends. This will help you adjust your sleep rhythm.</p><p>2. Comfortable space: Make sure your sleeping area is comfortable and free of distractions, such as too much light or noise.</p><p>3. Avoid caffeine and alcohol before bed: Limit your intake of coffee and alcohol, especially in the evening, to avoid disrupting the sleep process.</p><p>4. Physical activity: Regular physical activity improves sleep quality. Try to exercise regularly, but not directly before bed.</p><p>5. Healthy diet: Avoid heavy meals right before bed, but eat light and healthy.</p><p>6. Relaxation: Introduce a relaxing evening routine, such as a warm bath, reading a book, or meditation, to prepare for sleep.</p><p><br></p><p>Healthy sleep habits are essential for our overall well-being. Try to incorporate them into your life and enjoy deep, restorative sleep.</p>",
  created_at: Faker::Time.backward(days: 30),
  account: Specialist.all.sample.user.account
)

Article.create!(
  title: "Eye Health: Vision Protection",
  description: "How to take care of your vision and avoid eye problems.",
  body: "<p>Your eyes are a precious treasure that is worth protecting. Here are a few simple rules that will help you take care of your eye health:</p><p><br></p><p>1. Regular eye exams: Regular eye exams allow you to detect vision problems early on and avoid more serious conditions.</p><p>2. Appropriate lighting: Well-lit rooms help to avoid excessive eye strain. Avoid glare from screens and bright light.</p><p>3. Breaks from computer work: Take a short break from looking at a screen every hour, focusing on a distant object to reduce eye strain.</p><p>4. Healthy diet: Eat foods rich in antioxidants, such as carrots, spinach, and fish, which support eye health.</p><p>5. Sun protection: Wearing sunglasses with UV protection protects your eyes from harmful radiation that can damage the retina.</p><p>6. Avoid smoking: Smoking increases the risk of eye diseases. If you smoke, consider quitting.</p><p><br></p><p>Take care of your eyes by following these simple rules. It is worth investing in long-term eye health.</p>",
  created_at: Faker::Time.backward(days: 30),
  account: Specialist.all.sample.user.account
)

Article.create!(
  title: "The Role of Vitamins and Minerals in Diet",
  description: "The significance of micronutrients in daily diet and health.",
  body: "<p>Vitamins and minerals play a crucial role in maintaining health and the proper functioning of the body. Here's why they are important and how one can ensure an adequate supply of them in the diet:</p><p><br></p><p>1. Supporting body functions with vitamins: Vitamins such as vitamin C, D, E, and K help in nutrient absorption, support immunity, and maintain healthy bones.</p><p>2. Minerals for maintaining balance: Minerals like calcium, magnesium, iron, and potassium are essential for proper functioning of muscles, bones, the circulatory system, and the nervous system.</p><p>3. Antioxidants protecting against cell damage: Vitamins A, C, and E, as well as minerals like selenium, act as antioxidants, protecting cells from oxidative damage.</p><p>4. Valuable sources of vitamins and minerals: Fresh fruits, vegetables, nuts, fish, and dairy products are rich sources of vitamins and minerals.</p><p>5. Balanced diet: Consuming a variety of foods ensures access to different vitamins and minerals that the body needs.</p><p><br></p><p>Understanding the role of vitamins and minerals in the diet is crucial for maintaining a healthy lifestyle. Make sure your diet is balanced and contains essential nutrients.</p>",
  created_at: Faker::Time.backward(days: 30),
  account: Specialist.all.sample.user.account
)

Article.create!(
  title: "Healthy Skin and Body Care",
  description: "Tips for maintaining healthy skin and body.",
  body: "<p>Skin care is an important part of overall health. Healthy skin not only affects appearance but also plays a crucial role in protecting the body. Here are a few skincare principles worth implementing:</p><p><br></p><p>1. Moisturizing: Regularly moisturizing the skin helps maintain its elasticity and protects it from dryness.</p><p>2. Sun protection: Using UV protection creams helps prevent harmful sun rays that can accelerate skin aging processes.</p><p>3. Balanced diet: Consuming fruits, vegetables, nuts, and fish rich in nutrients supports healthy skin.</p><p>4. Avoiding smoking and excessive alcohol: Tobacco smoking and excessive alcohol consumption can negatively impact skin condition.</p><p>5. Hygiene: Regularly washing the skin and avoiding excessive use of cosmetics can help prevent infections and acne.</p><p>6. Sleep and stress reduction: Good sleep habits and stress reduction have a positive impact on skin appearance.</p><p><br></p><p>By taking care of healthy skin, you protect it from external influences and help maintain a youthful appearance. Take care of your skin by following these simple skincare principles.</p>",
  created_at: Faker::Time.backward(days: 30),
  account: Specialist.all.sample.user.account
)

Article.create!(
  title: "Meditation and Relaxation Techniques",
  description: "Mind and body relaxation through meditation and relaxation techniques.",
  body: "<p>Meditation and relaxation techniques are effective tools for reducing stress, improving well-being, and overall health. Here's why it's worth incorporating them into daily life:</p><p><br></p><p>1. Stress reduction: Meditation and relaxation techniques help lower cortisol levels, the stress hormone, which has a beneficial impact on mental and physical health.</p><p>2. Improved concentration: Regular meditation practice enhances the ability to focus attention, aiding in problem-solving and decision-making.</p><p>3. Better sleep: Relaxation before bedtime can enhance sleep quality and assist in combating insomnia.</p><p>4. Emotional regulation: Meditation teaches how to control emotions and reactions to stressful situations.</p><p>5. Increased body awareness: Through meditation, we can more consciously perceive our own bodies, aiding in recognizing signals sent by our organism.</p><p>6. Simple practice: Meditation and relaxation techniques are easy to implement in daily life and do not require special equipment.</p><p><br></p><p>Meditation and relaxation techniques are accessible to everyone and can significantly improve life quality. Consider incorporating them into your daily routine for better mental and physical health.</p>",
  created_at: Faker::Time.backward(days: 30),
  account: Specialist.all.sample.user.account
)

Article.create!(
  title: "Healthy Organic Food and GMO",
  description: "Discussion on organic food and its relation to GMO.",
  body: "<p>Understanding the difference between organic food and products containing GMOs is crucial for making informed decisions about diet. Here's what you should know:</p><p><br></p><p>1. Organic Food: Organic products are cultivated and produced following strict standards, excluding artificial pesticides and fertilizers. They are free from synthetic chemical additives.</p><p>2. GMOs (Genetically Modified Organisms): Products containing GMOs have been genetically modified to exhibit specific traits. This can involve plants and animals.</p><p>3. Safety and Health: Currently, there isn't definitive evidence of the harmfulness of GMO products to health, but many people opt for organic food due to long-term concerns.</p><p>4. Choice: Choosing between organic food and GMO products depends on individual preferences and beliefs. It's worth reading labels carefully and consciously selecting food products.</p><p>5. Ecology: Organic food often promotes environmentally friendly practices, reducing excessive soil and water pollution.</p><p>6. Costs: Organic products are often more expensive than those containing GMOs, which can be a determining factor in choice.</p><p><br></p><p>Consider your dietary choices based on your own needs and values. It's valuable to be aware of what you put into your body to ensure a healthy diet.</p>",
  created_at: Faker::Time.backward(days: 30),
  account: Specialist.all.sample.user.account
)

Rails.logger.debug "Seeding specialists and articles completed."
