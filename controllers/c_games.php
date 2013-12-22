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
        $q = "SELECT * FROM posts WHERE user_id =".$this->user->user_id;
        # Run the query
        $posts = DB::instance(DB_NAME)->select_rows($q);

        # Pass data to the View
        $this->template->content->posts = $posts;

        # Pass error data to the view
        $this->template->content->error = $error;

        # Render template
        echo $this->template;

    }

    public function p_newg() {

        if(empty($_POST['content'])) {
           Router::redirect("/posts/add/error");
        } 
        
        # Associate this post with this user
        $_POST['user_id']  = $this->user->user_id;

        # Unix timestamp of when this post was created / modified
        $_POST['created']  = Time::now();
        $_POST['modified'] = Time::now();

        # Insert
        # Note we didn't have to sanitize any of the $_POST data because we're using the insert method which does it for us
        DB::instance(DB_NAME)->insert('posts', $_POST);

        # Redirect to the add page
        Router::redirect("/posts/add");
    }

    


} # end of the class
