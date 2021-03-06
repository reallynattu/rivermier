class Rivermier.Views.PhotosShow extends Backbone.View

	template: JST['photos/show']
	actionButtons: JST['partials/action_buttons']

	tagName: 'li'

	events: ->
		'mouseover .tweet': 'mouseover'
		'mouseout .tweet': 'mouseout'  

	render: ->
		user = @model.get('tweet').user
		tweet = @model.get('tweet')
		photo = @model
		$(@el).html(@template(tweet: tweet, user: user, photo: photo, actionButtons: @actionButtons))
		@after_render(this)
		this

	after_render: ->
		@timeago(this)
		$(@el).find('p').linkify(@toHashtagUrl);

	mouseover: ->
		$(@el).find('.action-buttons').show()

	mouseout: ->
		$(@el).find('.action-buttons').hide()

	timeago: ->
		$(@el).find('.time').timeago()

	toHashtagUrl: (hashtag) ->
		"https://twitter.com/search/?src=hash&q=%23" + hashtag			