module Dashboard::TasksHelper
	def situation(task)
	   if task.status.eql? true then
	   	'Concluido'
	   elsif task.status.eql? false then
	   	'Pendente'
	   else 
	   	 'Indeferido'
	   end
	end	

	def owner(task)
		" --#{task.user.email}"
	end
end
