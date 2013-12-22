/**
* My memory card game
*
* @class Memory
* @constructor set_board
*
* Usage:
* 	Create two divs, one with id "board", one with id "scoreboard"
* 	Initiate game, specifying how many cards you want to play with:
* 	Memory.set_board("board", "scoreboard", how_many_cards);
* 
* 
*/

var Memory = {
	
	// {int} Keep a running total of points
	points: 0,
	
	// {Object} HTML Objects
	board: '',
	scoreboard: '',
	
	// {array} To display card images. images are saved with these alphabets A.PNG, B.PNG etc.
	alphabet: ['A','B','C','D','E','F','G','H','I','J','K','L'],
	
	// {int} Keep track of how many cards are flipped, so when two are flipped up we know it's time to flip them back down
	flipped_card_count: 0,

	//To count the consecutive clicks of the same caard and give more score.
	repete_count: 1,

	// To save the previous card and compare with the current card for awarding points.
	prv_card : '',
		
	/*-------------------------------------------------------------------------------------------------
	@param {string} id_of_board
	@param {string} id_of_scoreboard
	@param {int}    how_many_cards
	@return void
	-------------------------------------------------------------------------------------------------*/
	set_board: function(id_of_board, id_of_scoreboard, how_many_cards) {

		this.repete_count = 1;
		this.flipped_card_count = 0;
		this.points = 0;
		this.prv_card = '';
		
		//To count how many dangers cards in the current game
		this.how_many_danger = 0;

		// First, identify the board and the scoreboard objects
		this.board      = $('#' + id_of_board);
		this.scoreboard = $('#' + id_of_scoreboard);
		
		// This will hold all the cards as we load them, so we can easily shuffle them
		var cardsArr = [];
		//var cardsArrCode = [];
	
		// This will hold the HTML string of divs that are our cards with images
		var cardsStr = String();

		// This will hold the HTML string of divs that are our cards without images
		var cardsStrCode = String();
		
		//L.PNG is the danger simbol. We need this image to be displayed atleast one time. So we are initializing this with L 
		var random_letter = 'L';
		
		// Loop for how many cards we're playing with
		for(var i = 0; i < how_many_cards; i++) {
			
			// Counting Danger cards in the current game
			if (random_letter == 'L') {
				this.how_many_danger++;
			};
			
			// Add the card with the image to the array
			cardsArr[i] = "<div class='card clickable' id='" + random_letter + i +"' clicked=''> <img src= '/images/" + random_letter + ".PNG'/> </div>";	
			
			//Generate a random letter from  our alphabet array 
			random_letter = this.alphabet[Math.floor(this.alphabet.length * Math.random())];
		}
		
		// Shuffle the deck / array
		cardsArr = this.shuffle(cardsArr);
				
		// Now load the cards array into a string
		for(var card in cardsArr) {
			cardsStr = cardsStr + cardsArr[card];
		}	

		// Replace images from the div tages and just have the alphabets. So that string can be used to hide the images.
		cardsStrCode = cardsStr.replace(/<img src= '\/images\//g,"");
		cardsStrCode = cardsStrCode.replace(/.PNG'\/>/g,"");

		// Now inject the cards string into the game board
		this.board.html(cardsStr);

		//Display score board with 0 points.
		this.scoreboard.html("Your Score: 0");
		
		var newthis = this;
		//to perform an action after 2 seconds of the html page load (hide the images on the cards). 
		//i could use jQuery "$("#flipbox").flip({" but i wanted to try it in Javascript... 
		setTimeout(function() {

			//display cards without images
			newthis.board.html(cardsStrCode);

			//On click of the each card
			 
			$('.clickable').on('click', function() {
				if($(this).attr('clicked') != 'yes')
				newthis.choose_my_card($(this), how_many_cards);
				$(this).attr('clicked','yes');
			});
			
		}, 1500);  // 2 seconds


		// Set up the event listener for the cards
		// Have to use "Memory" instead of "this" because in this context "this" is referring to the event handler, not the class
		// Also, have to use "on" method instead of "click" because we'll be adding and removing the "clickable" class and will need to re-register the listener
		// See http://api.jquery.com/on/ for more details 
	},

	choose_my_card: function(cardObj, how_many_cards) {
		//alert(this.how_many_danger);
		this.flipped_card_count ++

		//to know the id of the selected card
		var divId = cardObj.attr('id');
		var divIdImage = divId.substr(0,1);

		//add image to the currently selected card's div. 
		var repStrN = "<img src= '/images/"+divIdImage+".PNG'/> </div>";
		
		//display the image for the selected card	
		cardObj.html(repStrN);	
	
		// Flip the card and remove the clickable class so it can't be clicked again
		cardObj.removeClass('clickable');
		cardObj.addClass('flipped');
		
		//Current selected card
		var selected_card = divIdImage;
		
		if (divId.substr(0,1) !='L'){
			// To see if the cards match with the previously selected card
			if(this.prv_card == selected_card) {
				//Increment the repete count as user selected the same card as previous time
				this.repete_count ++;
				// Award bonus points. Multiply repete_count with normal points(10)  
				this.points = this.points + (this.repete_count * 10);	
			}
			//If it does't match with the previous click, award normal points(10)
			else{
				this.points = this.points + 10;
				this.repete_count = 1;
			}
		}

		// Dsiplay the updated scoreboard
		this.scoreboard.html("Your Score: "+ this.points);

		//Record the previous card
		this.prv_card  = divIdImage;

		//assign flipped_card_count to local variable
		var fcc = this.flipped_card_count;

		//if user clicked all the cards other than danger or if the user clicks on the danger, reset all the counters as the game is finished.
		if (divId.substr(0,1) =='L' || fcc == how_many_cards - this.how_many_danger)
		{
			this.repete_count = 1;
			this.flipped_card_count = 0;
			this.points = 0;
			this.prv_card = '';
		};

		var nthis = this;
		// to delay all open cards(including the last one opened) for half second before displaying the Game over message.
		setTimeout(function() {
			//When user clicks on the danger card, Game over - lost! and remove score 
			if (divId.substr(0,1) =='L')
			{
				$('.board').html('Game Over! You lost, try again!');	
				$('.scoreboard').html('');	
			};
			
			// When user clicks all card but not the danger, Game over - Won!
			if (fcc == how_many_cards - nthis.how_many_danger) {
				$('.board').html('Congratulation!! Level completed successfully, play again!.');	
			};

		}, 500);  // 2 seconds


		
	},

	/*-------------------------------------------------------------------------------------------------
	
	/*-------------------------------------------------------------------------------------------------
	From: http://dzone.com/snippets/array-shuffle-javascript
	-------------------------------------------------------------------------------------------------*/
	shuffle: function(obj){ 
    	for(var j, x, i = obj.length; i; j = parseInt(Math.random() * i), x = obj[--i], obj[i] = obj[j], obj[j] = x);
    	return obj;
    }
	
	
}; // eoc





