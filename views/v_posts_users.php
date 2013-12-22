

<!-- This is to display all users with follow / Unfollow link -->
<br>
<table>
<?php foreach($users as $user): ?>
<tr>
    <td>
    <!-- Print this user's name -->
    <?=$user['first_name']?> <?=$user['last_name']?>
</td>
<td>
    <!-- If there exists a connection with this user, show a unfollow link -->
    <?php if(isset($connections[$user['user_id']])): ?>
        <a href='/posts/unfollow/<?=$user['user_id']?>'>Unfollow</a>

    <!-- Otherwise, show the follow link -->
    <?php else: ?>
        <a href='/posts/follow/<?=$user['user_id']?>'>Follow</a>
    <?php endif; ?>
    </td>
</tr>

<?php endforeach; ?>
</table>
<br>
<br>