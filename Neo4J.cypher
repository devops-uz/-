CREATE
  (bntu: Univercity {name: "БНТУ"}),
  (bsuir: Univercity {name: "БГУИР"}),
  (fitu: Faculty {name: "ФИТУ", number_of_students: 1500}) -[:UNIVERCITY]-> (bsuir),
  (ksis: Faculty {name: "КСИС", number_of_students: 3600}) -[:UNIVERCITY]-> (bsuir),
  (ef: Faculty {name: "ЭФ", number_of_students: 5300}) -[:UNIVERCITY]-> (bntu),
  (fitr: Faculty {name: "ФИТР", number_of_students: 1900}) -[:UNIVERCITY]-> (bntu),
  (ii: Speciality {name: "ИИ"}) -[:FACULTY]-> (fitu),
  (asoi: Speciality {name: "АСОИ"}) -[:FACULTY]-> (fitu),
  (iitp: Speciality {name: "ИИТП"}) -[:FACULTY]-> (ksis),
  (poit: Speciality {name: "ПОИТ"}) -[:FACULTY]-> (ksis),
  (es: Speciality {name: "ЭС"}) -[:FACULTY]-> (ef),
  (rza: Speciality {name: "РЗА"}) -[:FACULTY]-> (ef),
  (isit: Speciality {name: "ИСИТ"}) -[:FACULTY]-> (fitr),
  (bntu_poit: Speciality {name: "ПОИТ"}) -[:FACULTY]-> (fitr),
  (st1: Student {name: "Саша", age: 19}) -[:SPECIALITY]-> (ii),
  (st2: Student {name: "Вася", age: 18}) -[:SPECIALITY]-> (asoi),
  (st3: Student {name: "Катя", age: 19}) -[:SPECIALITY]-> (iitp),
  (st4: Student {name: "Ахмед", age: 20}) -[:SPECIALITY]-> (poit),
  (st5: Student {name: "Женя", age: 17}) -[:SPECIALITY]-> (es),
  (st6: Student {name: "Вася", age: 21}) -[:SPECIALITY]-> (rza),
  (st7: Student {name: "Настя", age: 20}) -[:SPECIALITY]-> (isit),
  (st8: Student {name: "Маша", age: 26}) -[:SPECIALITY]-> (bntu_poit)

MATCH
  (faculty: Faculty) -[:UNIVERCITY]-> (:Univercity{name: "БГУИР"})
RETURN faculty

MATCH
  (speciality: Speciality) -[:FACULTY]-> (faculty: Faculty),
  (faculty) -[:UNIVERCITY]-> (:Univercity{name: "БНТУ"})
RETURN speciality

MATCH
  (student: Student) -[:SPECIALITY]-> (:Speciality{name: 'ПОИТ'})
RETURN student

MATCH
  (student: Student) -[:SPECIALITY]-> (speciality: Speciality{name: 'ПОИТ'}),
  (speciality) -[:FACULTY]-> (faculty: Faculty),
  (faculty) -[:UNIVERCITY]-> (:Univercity {name: "БГУИР"})
RETURN student

MATCH
  (student: Student) -[:SPECIALITY]-> (speciality: Speciality),
  (speciality) -[:FACULTY]-> (faculty: Faculty),
  (faculty) -[:UNIVERCITY]-> (:Univercity {name: "БНТУ"})
  WHERE student.age > 19
RETURN student

MATCH
  (student: Student) -[:SPECIALITY]-> (speciality: Speciality {name: "РЗА"}),
  (speciality) -[:FACULTY]-> (faculty: Faculty),
  (faculty) -[:UNIVERCITY]-> (:Univercity {name: "БНТУ"})
  WHERE student.name = "Вася"
RETURN student.age

MATCH
  (student: Student) -[:SPECIALITY]-> (speciality: Speciality),
  (speciality) -[:FACULTY]-> (faculty: Faculty)
  WHERE faculty.number_of_students > 2000
RETURN AVG(student.age)

MATCH
  (student: Student) -[:SPECIALITY]-> (speciality: Speciality{name: 'ИИ'}),
  (speciality) -[:FACULTY]-> (faculty: Faculty),
  (faculty) -[:UNIVERCITY]-> (:Univercity {name: "БГУИР"})
RETURN MAX(student.age)

MATCH
  (student: Student) -[:SPECIALITY]-> (speciality: Speciality),
  (speciality) -[:FACULTY]-> (faculty: Faculty),
  (student_2: Student) -[:SPECIALITY]-> (speciality_2: Speciality),
  (speciality_2) -[:FACULTY]-> (faculty)
  WHERE student <> student_2 AND student.name < student_2.name
RETURN student, student_2

MATCH
  (student: Student) -[:SPECIALITY]-> (speciality: Speciality),
  (speciality) -[:FACULTY]-> (faculty: Faculty),
  (faculty) -[:UNIVERCITY]-> (:Univercity {name: "БГУИР"})
  WITH student, speciality, AVG(student.age) AS age
  WHERE age >= 18
RETURN speciality
