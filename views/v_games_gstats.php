<!-- This page will display all the stat of the users who are being followed by the current logged in user -->

<?php foreach($stats as $stat): ?>

	    <?=$stat['first_name']?> 
	    <?=$stat['last_name']?>  
	    <?=$stat['level']?> 
		<time datetime="<?=Time::display($stat['created'],'Y-m-d G:i')?>">
		<?=Time::display($stat['created'])?>
		    </time>
	    <?=$stat['score']?></p>
<?php endforeach; ?>
		
	t = $('stats')
    $.uiTableFilter( t, phrase )