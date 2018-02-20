module ApplicationHelper
   def pagination(model)
	 render partial: 'shared/paginate', locals: { model: model }
   end
   def has_records?(collection, message = 'Nenhum registro encontrado.')
   	render partial: 'shared/no-records', locals: {message: message} if collection.empty? 
   end
   def paginate objects, options = {}
     options.reverse_merge!( theme: 'twitter-bootstrap' )
     super( objects, options )
  end
end
