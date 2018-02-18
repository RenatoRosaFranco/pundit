module ApplicationHelper
   def pagination(model)
	 render partial: 'shared/paginate', locals: { model: model }
   end
   def paginate objects, options = {}
     options.reverse_merge!( theme: 'twitter-bootstrap' )
     super( objects, options )
  end
end
