<!-- This page will display all the post of the users who are being followed by the current logged in user -->

<?php foreach($posts as $post): ?>

	<article>

	    <h4><?=$post['first_name']?> <?=$post['last_name']?>  --  Posted on 
		    <time datetime="<?=Time::display($post['created'],'Y-m-d G:i')?>">
		        <?=Time::display($post['created'])?>
		    </time>
		</h4>

	    <p><?=$post['content']?></p>
		<hr>
	
	</article>
	
<?php endforeach; ?>
