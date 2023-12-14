Rails.logger.debug "Seeding predefined symptoms ..."

azs = PredefinedDisease.find_by(name: "atopic dermatitis")
azs.predefined_symptoms.create(
  [
    {
      name: "itchiness",
      description: "Feeling of unpleasant skin itching."
    },
    {
      name: "redness",
      description: "Visible redness of the skin."
    },
    {
      name: "skin dryness",
      description: "Excessively dry and rough skin."
    }
  ]
)

ms = PredefinedDisease.find_by(name: "multiple sclerosis")
ms.predefined_symptoms.create(
  [
    {
      name: "Fatigue",
      description: "Excessive fatigue is a common symptom of multiple sclerosis."
    },
    {
      name: "Vision problems",
      description: "Vision disturbances, such as double vision, may occur in MS patients."
    },
    {
      name: "Balance issues",
      description: "Balance disturbances can be a symptom of multiple sclerosis."
    },
    {
      name: "Speech problems",
      description: "Speech disturbances may occur in some MS patients."
    },
    {
      name: "Numbness or tingling",
      description: "Numbness or tingling in various body parts may be a symptom of multiple sclerosis."
    },
    {
      name: "Muscle and joint pains",
      description: "Muscle and joint pains may occur in MS patients."
    },
    {
      name: "Memory and concentration problems",
      description: "Memory and concentration disturbances may be a symptom of multiple sclerosis."
    },
    {
      name: "Bladder dysfunction",
      description: "Bladder dysfunction, such as urinary incontinence, may occur in MS patients."
    }
  ]
)

obesity = PredefinedDisease.find_by(name: "overweight")
obesity.predefined_symptoms.create(
  [
    {
      name: "increased body mass",
      description: "Excessive accumulation of body fat."
    },
    {
      name: "difficulty in maintaining physical activity",
      description: "Experiencing difficulty in performing physical activities due to excessive body weight."
    },
    {
      name: "breathing problems",
      description: "Difficulty breathing, especially during physical exertion."
    },
    {
      name: "fatigue and lack of energy",
      description: "Experiencing chronic fatigue and lack of energy associated with obesity."
    },
    {
      name: "digestive issues",
      description: "Digestive disturbances and problems with nutrient absorption."
    },
    {
      name: "joint pain",
      description: "Aches and discomfort in the joints, often associated with excessive weight."
    }
  ]
)

diabetes = PredefinedDisease.find_by(name: "diabetes")
diabetes.predefined_symptoms.create(
  [
    {
      name: "excessive thirst (polydipsia)",
      description: "Intense feeling of thirst, often present in diabetes."
    },
    {
      name: "excessive urination (polyuria)",
      description: "Frequent passing of a large amount of urine, characteristic of diabetes."
    },
    {
      name: "excessive hunger (polyphagia)",
      description: "Strong hunger and excessive appetite, especially in type 1 diabetes."
    },
    {
      name: "sudden weight loss",
      description: "Unexpected and uncontrolled weight loss, particularly in type 1 diabetes."
    },
    {
      name: "fatigue and weakness",
      description: "Excessive tiredness and body weakness associated with sugar metabolism disorders."
    },
    {
      name: "frequent infections, delayed wound healing",
      description: "Increased susceptibility to infections and delayed wound healing are symptoms of diabetes."
    },
    {
      name: "vision disturbances",
      description: "Changes in vision abilities, such as blur or double vision, characteristic in diabetes."
    },
    {
      name: "thickening, itching, or dryness of the skin",
      description: "Skin symptoms of diabetes, such as thickening, itching, and dryness."
    },
    {
      name: "hand tremors",
      description: "Hand tremors may be associated with unstable blood sugar levels."
    },
    {
      name: "sensory disturbances in hands and feet",
      description: "Loss of sensation, numbness, or tingling in hands and feet, often associated with diabetes."
    }
  ]
)

heart_failure = PredefinedDisease.find_by(name: "heart failure")
heart_failure.predefined_symptoms.create(
  [
    {
      name: "shortness of breath",
      description: "Difficulty breathing, feeling of breathlessness."
    },
    {
      name: "fatigue",
      description: "Experiencing chronic fatigue and body weakness."
    },
    {
      name: "edema",
      description: "Excessive fluid retention in the body, causing swelling."
    },
    {
      name: "excessive sweating",
      description: "Excessive sweating, especially at night."
    },
    {
      name: "increased urination",
      description: "Frequent passing of a large amount of urine."
    },
    {
      name: "excessive fatigue",
      description: "Experiencing chronic fatigue and body weakness."
    }
  ]
)

osteoporosis = PredefinedDisease.find_by(name: "osteoporosis")
osteoporosis.predefined_symptoms.create(
  [
    {
      name: "Bone fractures",
      description: "Osteoporosis increases the risk of bone fractures, especially in the hip, spine, and wrist."
    },
    {
      name: "Muscle cramps and pains",
      description: "People with osteoporosis may experience muscle cramps and pains."
    },
    {
      name: "Loss of height",
      description: "Osteoporosis can lead to height loss due to vertebral fractures."
    },
    {
      name: "Spinal curvature",
      description: "Spinal curvature, called kyphosis, is a common symptom of osteoporosis."
    },
    {
      name: "Reduced mobility",
      description: "Osteoporosis may limit mobility and physical function."
    },
    {
      name: "Back pain",
      description: "Back pain, especially in the spine area, can be a symptom of osteoporosis."
    },
    {
      name: "Weak nails",
      description: "Osteoporosis can affect the condition of nails, making them weak and brittle."
    },
    {
      name: "High risk of fractures",
      description: "Osteoporosis increases the overall risk of bone fractures."
    }
  ]
)

hypertension = PredefinedDisease.find_by(name: "hypertension")
hypertension.predefined_symptoms.create(
  [
    {
      name: "Headache",
      description: "Frequent headaches, especially in the temples and forehead, can be a symptom of hypertension."
    },
    {
      name: "Dizziness",
      description: "Dizziness and a feeling of instability may occur with high blood pressure."
    },
    {
      name: "Nausea",
      description: "Nausea and vomiting may be caused by hypertension."
    },
    {
      name: "Vision problems",
      description: "Hypertension can lead to vision disturbances, such as blurred vision."
    },
    {
      name: "Fatigue",
      description: "People with hypertension may experience chronic fatigue."
    },
    {
      name: "Chest pain",
      description: "Chest pain or shortness of breath may occur with hypertension."
    },
    {
      name: "Breathing difficulties",
      description: "Difficulty breathing and shortness of breath are common symptoms of hypertension."
    },
    {
      name: "Tingling in hands and feet",
      description: "Tingling, numbness, or loss of sensation in hands and feet may be associated with hypertension."
    }
  ]
)

hypothyroidism = PredefinedDisease.find_by(name: "hypothyroidism")
hypothyroidism.predefined_symptoms.create(
  [
    {
      name: "general fatigue and weakness",
      description: "Feeling of chronic fatigue and overall body weakness."
    },
    {
      name: "slower mental processes and reactions",
      description: "Slowed thought processes and mental reactions."
    },
    {
      name: "weight gain",
      description: "Unintended weight gain despite diet and physical activity."
    },
    {
      name: "increased sensitivity to cold",
      description: "Increased sensitivity to low temperatures and feeling cold."
    },
    {
      name: "dry skin and hair loss",
      description: "Skin becomes dry, and hair falls out more than usual."
    },
    {
      name: "decreased hair on eyebrows and eyelashes",
      description: "Thinning of eyebrows and eyelashes, characteristic of hypothyroidism."
    },
    {
      name: "slowed heart rate (bradycardia)",
      description: "Slowed heart rate, known as bradycardia."
    },
    {
      name: "memory and concentration problems",
      description: "Difficulties with memory and concentration related to hypothyroidism."
    },
    {
      name: "constipation",
      description: "Frequent constipation and intestinal peristalsis issues."
    },
    {
      name: "excessive feeling of tiredness",
      description: "Feeling extremely tired, even after rest."
    }
  ]
)

asthma = PredefinedDisease.find_by(name: "asthma")
asthma.predefined_symptoms.create(
  [
    {
      name: "shortness of breath or wheezing",
      description: "Breathing difficulties, feeling of shortness of breath."
    },
    {
      name: "wheezing",
      description: "Characteristic sound of wheezing during an asthma attack."
    },
    {
      name: "chest tightness",
      description: "Audible wheezing in the chest during an asthma attack."
    },
    {
      name: "nighttime coughing",
      description: "Coughing that worsens at night is often a symptom of asthma."
    },
    {
      name: "bronchial constriction",
      description: "Constriction of the bronchi making airflow difficult."
    },
    {
      name: "difficulty clearing mucus",
      description: "Difficulty in clearing mucus from the airways."
    },
    {
      name: "increased bronchial reactivity to triggers",
      description: "Heightened bronchial reaction to various triggers leading to constriction."
    },
    {
      name: "excessive mucus production",
      description: "Increased production of mucus in the airways."
    },
    {
      name: "increased coughing activity in the morning",
      description: "Increased coughing activity, especially in the morning."
    },
    {
      name: "feeling of tightness or pressure in the chest",
      description: "Feeling of tightness or pressure in the chest during an asthma attack."
    },
    {
      name: "fatigue associated with breathing difficulties",
      description: "Experiencing fatigue due to breathing difficulties caused by asthma."
    }
  ]
)

celiac_disease = PredefinedDisease.find_by(name: "celiac disease")
celiac_disease.predefined_symptoms.create(
  [
    {
      name: "Diarrhea",
      description: "Frequent diarrhea is one of the main symptoms of celiac disease."
    },
    {
      name: "Abdominal pain",
      description: "Abdominal pain and cramping may occur in individuals with celiac disease."
    },
    {
      name: "Bloating",
      description: "Bloating and discomfort in the abdominal cavity are common symptoms of celiac disease."
    },
    {
      name: "Nausea",
      description: "Nausea and vomiting may be caused by celiac disease."
    },
    {
      name: "Weight loss",
      description: "Unintended weight loss is a common symptom of celiac disease."
    },
    {
      name: "Fatigue",
      description: "People with celiac disease may experience chronic fatigue."
    },
    {
      name: "Joint pain",
      description: "Joint pain and inflammation are symptoms of celiac disease."
    },
    {
      name: "Concentration problems",
      description: "Difficulty concentrating and memory problems may occur in individuals with celiac disease."
    }
  ]
)

psoriasis = PredefinedDisease.find_by(name: "psoriasis")
psoriasis.predefined_symptoms.create(
  [
    {
      name: "Red patches on the skin",
      description: "Psoriasis presents as red patches on the skin, which are typically raised and covered with silvery scales."
    },
    {
      name: "Skin itching",
      description: "Itching is a common symptom of psoriasis, which can be very bothersome."
    },
    {
      name: "Nail thickening",
      description: "Psoriasis can affect the nails, causing them to thicken and change shape."
    },
    {
      name: "Joint deformities",
      description: "Some psoriasis patients may experience changes in the shape of their joints, especially in the form of psoriatic arthritis."
    },
    {
      name: "Red and swollen joints",
      description: "Joint inflammation is another symptom of psoriasis, which can lead to redness and swelling."
    },
    {
      name: "Skin peeling",
      description: "Peeling skin is a characteristic symptom of psoriasis."
    },
    {
      name: "Skin pain and burning",
      description: "Skin pain and burning may accompany psoriasis, especially around skin lesions."
    },
    {
      name: "Changes in nail color",
      description: "Nails may change color due to psoriasis, becoming yellow, brown, or white."
    }
  ]
)

crohn_disease = PredefinedDisease.find_by(name: "crohns disease")
crohn_disease.predefined_symptoms.create(
  [
    {
      name: "Diarrhea",
      description: "Diarrhea is a common symptom of Crohn's disease."
    },
    {
      name: "Abdominal pain",
      description: "Abdominal pain and cramps can occur in patients with Crohn's disease."
    },
    {
      name: "Weight loss",
      description: "Unintended weight loss is a frequent symptom of Crohn's disease."
    },
    {
      name: "Blood in stool",
      description: "The presence of blood in stool may occur in patients with Crohn's disease."
    },
    {
      name: "Fever",
      description: "Increased body temperature and fever are symptoms of Crohn's disease, especially during inflammation."
    },
    {
      name: "Bloating",
      description: "Bloating and discomfort in the abdominal cavity are common symptoms of Crohn's disease."
    },
    {
      name: "Nausea",
      description: "Nausea and vomiting can be caused by Crohn's disease."
    },
    {
      name: "Fatigue",
      description: "People with Crohn's disease may experience chronic fatigue."
    }
  ]
)

parkinson_disease = PredefinedDisease.find_by(name: "parkinsons disease")
parkinson_disease.predefined_symptoms.create(
  [
    {
      name: "Tremor of hands",
      description: "Tremor of hands, especially resting tremor between the thumb and index finger, is a characteristic symptom of Parkinson's disease."
    },
    {
      name: "Muscle rigidity",
      description: "Muscle rigidity and resistance to movement are common symptoms of Parkinson's disease."
    },
    {
      name: "Bradykinesia",
      description: "Bradykinesia, or slow movement initiation, is another symptom of Parkinson's disease."
    },
    {
      name: "Postural instability",
      description: "Postural instability and difficulties in maintaining balance are characteristic of Parkinson's disease."
    },
    {
      name: "Micrographia",
      description: "Micrographia, a smaller handwriting, is a symptom of Parkinson's disease."
    },
    {
      name: "Sleep disturbances",
      description: "Parkinson's disease can lead to sleep disturbances such as insomnia."
    },
    {
      name: "Depression",
      description: "Depression is a commonly associated symptom of Parkinson's disease."
    },
    {
      name: "Speech changes",
      description: "Speech changes, like unclear or softer speech, may occur in patients with Parkinson's disease."
    }
  ]
)

endometriosis = PredefinedDisease.find_by(name: "endometriosis")
endometriosis.predefined_symptoms.create(
  [
    {
      name: "Menstrual pain",
      description: "Severe menstrual pain, known as dysmenorrhea, is one of the main symptoms of endometriosis."
    },
    {
      name: "Pain during intercourse",
      description: "Pain during intercourse, known as dyspareunia, can occur in women with endometriosis."
    },
    {
      name: "Abdominal pain",
      description: "Abdominal and pelvic pain are common symptoms of endometriosis."
    },
    {
      name: "Menstrual cycle irregularities",
      description: "Endometriosis can lead to irregularities in the menstrual cycle and intermenstrual bleeding."
    },
    {
      name: "Pain during urination or bowel movements",
      description: "Pain during urination or bowel movements may be associated with endometriosis in the pelvic area."
    },
    {
      name: "Fatigue",
      description: "Fatigue and general weakness may accompany endometriosis."
    },
    {
      name: "Infertility",
      description: "Endometriosis is a major risk factor for infertility in women."
    },
    {
      name: "Other symptoms",
      description: "Other symptoms may include back pain, nausea, diarrhea, or constipation."
    }
  ]
)

Rails.logger.debug "Seeding predefined symptoms done."
