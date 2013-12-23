<!-- This page will display all the stat of the users who are being followed by the current logged in user -->
<br>
Play history of all the people you are following.
<br>
<table id="table_id">
    <thead>
        <tr>
            <th>Full Name</th>
            <th>Level</th>
            <th>Date Time</th>
            <th>Score</th>
        </tr>
    </thead>

	<tbody>
		<?php foreach($stats as $stat): ?>
			<tr>
			    <td> <?=$stat['first_name']?>  <?=$stat['last_name']?>  </td>
			   
			    <td> <?=$stat['level']?>  cards</td>
				
				<td> <time datetime="<?=Time::display($stat['created'],'Y-m-d G:i')?>">
				<?=Time::display($stat['created'])?> </time> </td>

			    <td> <?=$stat['score']?> </td>
			</tr>   
		<?php endforeach; ?>
	</tbody>
</table>
