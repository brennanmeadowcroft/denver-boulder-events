$('#event_tag_tokens').tokenInput('/admin/tag_list.json', {
	theme: 'facebook',
	prePopulate: $('#event_tag_tokens').data('load'),
	propertyToSearch: 'description',
	preventDuplicates: true
});
