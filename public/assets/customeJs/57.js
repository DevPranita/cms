$(document).ready(function() {
	$('.marquee-text').html('');
	var html = "<marquee>For Testing <a href='https://www.deepl.com/en/translator' target='_blank'>Click here</a></marquee>"
	var html1 = "<marquee>Google Link <a href='https://www.google.com' target='_blank'>Click here</a></marquee>"
	$('.marquee-text').append(html);
	$('.marquee-text').append(html1);
	var url = window.location.origin+'/cms/front/test_api';

    $.ajax({
        url: url,
        type: 'POST',
        data: '',
        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        contentType: false,
        processData: false,
        success: function(response) {
            $('.table-body').html('');
            $('.marquee-custom1').html('');
            if(response.data.length > 0)
            {
            	$('.table-body').html('');
                $('.marquee-custom1').html('');

            	for (var i = 0; i <= response.data.length; i ++) {
            		
            		$('.table-body').append('<tr><td>'+i+'</td><td>'+response.data[i].name+'</td></tr>');
                    $('.marquee-custom1').append(response.data[i].name+' ');
            	}
            }
            // if(data.status == 'error') {
            //     bootnotify(data.message, 'Warning!', 'warning');
            // } else {
            //     bootnotify(data.message, 'Success!', 'success');
            // }
        }
    });
}); 