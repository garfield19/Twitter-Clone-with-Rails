json.array! @notifications do |notification|
	json.id notification.id
	#json.recipient notification.recipient
	json.actor notification.actor.username
	json.action notification.action
	json.notifiable do #notification.notifiable
		json.type ""
	end
	#json.url.message_path(notification.notifiable.message, anchor: dom_id(notification.notifiable))
end