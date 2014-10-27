var like = $('#like');

function set_status(data)
{
	if(data == 0)
	{
		like.val('Like');
	}
	else
	{
		like.val('Unlike');
	}
}

$(document).ready(function()
{
	set_status(like.val());
	
	like.click(function()
	{
		$.get( "index.php", { name: like.attr('name'), val: like.val() },
		
			function(data)
			{
				set_status(data);
			}
		);
	} );
} );