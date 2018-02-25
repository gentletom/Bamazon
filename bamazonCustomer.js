var mysql = require("mysql");
var inquirer = require("inquirer");
var table = require("console.table");

var connection = mysql.createConnection({
	host: "localhost",
	port: 3306,
	user: 'root',
	password: 'Diablo0o',
	database: 'bamazon_db'
});

connection.connect(function(err){
	if(err) throw err;
	display();
});
function display(){
	connection.query("SELECT * FROM products", function(err, res){
		if (err) throw err;
		console.table(res);

//make/place order
inquirer
	.prompt([
	{
	 	name: "choice",
	       type: "input",
	        message: "What is the ID of the product you would like to purchase?"
       	},
       	{
			name: "number",
	       	type: "input",
	        	 message: "How many items would you like to puchase?"
       		}
       	])

//check if quantity is in stock
       .then(function(answer){
       	var chosenItem;
           	for (var i=0; i < res.length; i++){
       		if(res[i].item_id == answer.choice){chosenItem = res[i];
       		}
       	}

       	if(parseInt(chosenItem.stock_quantity) > parseInt(answer.number)){
       		console.log("Item(s) is/are available")

//update the database
       connection.query("UPDATE products SET ? WHERE ?",[
       	{
       		stock_quantity: chosenItem.stock_quantity - answer.number
       	},
       	{
       		item_id: chosenItem.item_id
       	}],
       	function(error){
       		if (error) throw err;
       		console.log("Quantity puchased!");
       		display();
       	}
       );	
       }
//if the amount of order is unavailable        		
       else{
       	console.log("Insufficient Quantity! Please make another selection.");
       	display();
       }		
       });
})};