/* @pjs preload="../media/Water Fountain.jpg"; */

int multiplier = 2;
int x = 10 * multiplier;
int y = 10 * multiplier;
int drinkLevel = 4;
PImage img;

void setup(){
	size(600, 400); //Set size of canvas.
	
	background(#00ffff); //Set initial background color.
	
	img = loadImage("../media/Water Fountain.jpg"); //Load the image.
}

void draw(){
	background(#00ffff); //Set background color.
	
	stroke(0, 0, 0); //Reset the stoke color to black.
	
	strokeWeight(5); //Make the stoke thicker.
	
	quad(0, 0, 0, 184, 276, 184, 276, 0); //Draw a quad around the image.
	
	image(img, 0, 0); //Draw the image.
	
	person(); //Draw the person.
}

//Change x and y relative to the mouse location when the mouse is moved.
void mouseMoved(){
	x = mouseX - 75;
	y = mouseY - 75;
}

//Drink of fill the cup when the correct button is places.
void mouseReleased(){
	if(mouseButton == LEFT)
		drink();
	else if(mouseButton == RIGHT)
		fillCup();
}

//Draws the person relative to the mouse, also draws the cup.
void person(){
	strokeWeight(2); //Set the stoke width for the person.

	fill(255, 255, 255); //Set the fill color for the eyes.
	
	// --- HEAD ---
	//Left eye.
	ellipse(x, y, 14, 20);
	point(x, y);
	//Nose.
	triangle(x + 16, y + 8, x + 20, y, x + 24, y + 8);
	//Right eye.
	ellipse(x + 40, y, 14, 20);
	point(x + 40, y);
	
	// --- TORSO ---
	//Body
	line(x + 20, y + 20, x + 20, y + 40);
	
	// --- LIMBS ---
	//Left Arm.
	line(x + 10, y + 30, x, y + 30);
	//Right Arm.
	line(x + 30, y + 30, x + 40, y + 30);
	//Left Leg.
	line(x + 16, y + 50, x, y + 70);
	//Right Leg.
	line(x + 24, y + 50, x + 40, y + 70);
	
	// --- DRINK ---	
	//Left Half
	line(x + 50, y + 20, x + 54, y + 20); //Top line.
	line(x + 50, y + 20, x + 50, y + 40); //Centre line.
	line(x + 50, y + 42, x + 54, y + 42); //Bottom line.
	
	//Right Half
	line(x + 63, y + 20, x + 66, y + 20); //Top line.
	line(x + 68, y + 20, x + 68, y + 41); //Centre line.
	line(x + 63, y + 42, x + 66, y + 42); //Bottom line.
	
	drawCup();
}

//Checks the stage of the cup and draws the correct one.
void drawCup(){
	//Water In Cup
	fill(0, 107, 179); //Set color of water.
	stroke(0, 107, 179); //Remove border from water.
	
	int yPos;
	int recSizeY;
	
	if(drinkLevel == 4){
		yPos = y + 22;
		recSizeY = 18;
	}
	else if(drinkLevel == 3){
		yPos = y + 26;
		recSizeY = 14;
	}
	else if(drinkLevel == 2){
		yPos = y + 30;
		recSizeY = 10;		
	}
	else if(drinkLevel == 1){
		yPos = y + 36;
		recSizeY = 4;		
	}
	else if(drinkLevel == 0){
		yPos = -1;
		recSizeY = -1;	
	}
	
	//Draw the water.
	rect(x + 52, yPos, 14, recSizeY);
}

//Empties the cup stage by stage.
void drink(){
	if(drinkLevel > 0)
		drinkLevel -= 1;
	drawCup();
}

//Fills the cup with water (stage by stage) if the mouse is over the water fountain.
void fillCup(){
	if(mouseX < 275 && mouseY < 183){
		if(drinkLevel < 4)
			drinkLevel += 1;		
		drawCup();
	}
}
