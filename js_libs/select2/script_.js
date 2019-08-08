	<script>
		$(document).ready(function() {
          	$('.add_etap_js_block').select2({
    		  language: "ru",
              placeholder: {
                    id: '0',
                    text: '', //здесь текст плейсхолдера
                },
    		  allowClear: true
      	    });
            $('.add_etap_js_block').val(null).trigger('change');  //очищаем от выбранного - при загрузке будет пустое поле
		});
	</script>