select stu.student_id, stu.student_name, sub.subject_name, count(exam.subject_name) attended_exams from students stu
cross join subjects sub
left join examinations exam
on stu.student_id = exam.student_id and exam.subject_name = sub.subject_name
group by stu.student_id, stu.student_name, sub.subject_name
order by stu.student_id, sub.subject_name
