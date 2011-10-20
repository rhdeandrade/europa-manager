# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$(".sale #sale_customer_name").autocomplete 
		source: '/customers'
		select: (event, ui) ->
			id = ui.item.id
			$(".sale #sale_customer_id").val(id)
			$select = $(".sale #sale_sale_id")
			$.getJSON("/sales", {customer_id: id}, (data, status, xhr) ->
				$.each(data, (i, option) ->
					console.log(option)
					$select.append($("<option/>").val(option.id).text(option.product_name))
				)
			)

