<!-- To add a new post and display current logged in user's posts -->
<form method='POST' action='/posts/p_add'>

    <b><label for='content'>New Post:</label></b>
    <br> 
    <textarea name='content' id='content'></textarea>

    <br> 
    
	<?php if(isset($error)): ?>
        <div class='error'>
            <h5>Operation failed! Please enter something before submitting.</h5>
        </div>
        <br>
    <?php endif; ?>
    
    <input type='submit' value='Submit'>

</form> 

<br>

<!-- To display current logged in user's posts -->
<u><h2> My previous postings </h3></u>
<hr>

<?php foreach($posts as $post): ?>

	<article>

	    <h4>Posted on 
		    <time datetime="<?=Time::display($post['created'],'Y-m-d G:i')?>">
		        <?=Time::display($post['created'])?>
		    </time>
		</h4>

	    <p><?=$post['content']?></p>
		<hr>
	
	</article>
	
<?php endforeach; ?>
