/* @pjs preload="../media/Castle.jpg"; */

PImage img;

void setup(){
	size(600, 400); //Set size of canvas.
	
	background(#000000); //Set initial background color.
	
	frameRate(60);

	img = loadImage("../media/Castle.jpg"); //Load the image.
	
	img.resize(600, 400); //Resize image to fit canvas.
	
	image(img, 0, 0); //Draw the image.
}

void draw(){
	image(img, 0, 0); //Draw the image.
	
	translate(width / 2, height / 2); //Move the origin to the centre of the canvas.
	
	rotate(0.01 * frameCount); //Rotate the image around the origin.
	
	head(); //Draw the person.
}

void head(){
	//---HEAD---
	strokeWeight(1);
	stroke(255, 255, 0);
	fill(255, 255, 0);
	ellipseMode(CENTER);
	ellipse(0, 0, 100, 100);
	
	//---EYES---
	stroke(0, 0, 0);
	fill(0, 0, 0);	
	ellipse(-20, -10, 10, 20); //Left Eye
	ellipse(20, -10, 10, 20); //Right Eye
	
	//---MOUTH---
	fill(255, 255, 0);
	strokeWeight(5);
	arc(0 , 10, 60, 50, 0, PI); //Mouth
	
	//---CROWN---
	strokeWeight(2);
	fill(255, 191, 0);
	stroke(255, 191, 0);
	triangle(-25, -30, 0, -80, 25, -30);
	triangle(-50, -30, -50, -80, 0, -30);
	triangle(0, -30, 50, -80, 50, -30);
	
	//---CROWN POINTS---
	strokeWeight(15);
	fill(255, 191, 0);
	stroke(255, 191, 0);
	point(-50, -80);
	point(50, -80);
	point(0, -80);
	
	//---JEWELS---
	stroke(0, 255, 0);
	fill(0, 255, 0);
	point(0, -40); //Centre
	
	stroke(0, 64, 255);
	fill(0, 64, 255);
	point(-40, -40); //Left
	point(40, -40); //Right
	
}