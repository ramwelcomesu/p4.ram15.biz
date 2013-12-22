<?php
class games_controller extends base_controller {

    public function __construct() {
        parent::__construct();

        # Make sure user is logged in if they want to use anything in this controller
        if(!$this->user) {
            die("Members only. <a href='/users/login'>Login</a>");
        }
    }

    # To let add new post
    public function newg($error = NULL) {

        # Setup view
        $this->template->content = View::instance('v_games_newg');
        $this->template->title   = "New Game";
        
        # Build the query to display only post related to the current user 
        #This is one of the extra (+1) feature
        

        $q = "SELECT MAX(score) as score FROM gscore WHERE user_id =".$this->user->user_id ;
       // $q = "SELECT * FROM gscore WHERE user_id =".$this->user->user_id;
        # Run the query

        $gstats = DB::instance(DB_NAME)->select_rows($q);
        
        # Pass data to the View
        $this->template->content->gstats = $gstats;

        # Pass error data to the view
        $this->template->content->error = $error;

        # Render template
        echo $this->template;
    }

    public function p_newg() {
      // echo .$_GET['gscore']);

        # Associate this post with this user
        $_POST['user_id']  = $this->user->user_id;

        # Unix timestamp of when this post was created / modified
        $_POST['created']  = Time::now();
      
        # Insert
        # Note we didn't have to sanitize any of the $_POST data because we're using the insert method which does it for us
        DB::instance(DB_NAME)->insert('gscore', $_POST);

        # Redirect to the add page
       Router::redirect("/games/newg");
    }

    

    # to display list of all users with follow and unfollow option
    public function gstats() {
        # Set up the View
        $this->template->content = View::instance('v_games_gstats');
        $this->template->title   = "Memory Gamming :: Game Stats";

        # Query
        $q = 'SELECT 
                gscore.level,
                gscore.score,
                gscore.created,
                gscore.user_id AS post_user_id,
                users_users.user_id AS follower_id,
                users.first_name,
                users.last_name
            FROM gscore
            INNER JOIN users_users 
                ON gscore.user_id = users_users.user_id_followed
            INNER JOIN users 
                ON gscore.user_id = users.user_id
            WHERE users_users.user_id = '.$this->user->user_id;

        # Run the query, store the results in the variable $stats
        $stats = DB::instance(DB_NAME)->select_rows($q);

        # Pass data to the View
        $this->template->content->stats = $stats;

        # Render the View
        echo $this->template;

    }



} # end of the class
