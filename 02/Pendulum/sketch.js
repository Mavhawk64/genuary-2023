// theta_2dot + g/l * sin(theta) = 0

// theta_2dot = -g/l * sin(theta) --> use cos for visualization

let theta = 3.1415926 / 4;

let g = 0.5;

let l = 100;

let v = 0;

let a = 0;

// let m = 100; 

function setup() {
  createCanvas(400, 400);
}

function draw() {
  background(0);
  stroke(0,255,255);
  strokeWeight(2);
  let x = l * cos(theta);
  let y = -l * sin(theta);
  
  line(width/2,height/2,x+width/2,y+height/2);
  fill(0,255,255);
  circle(x+width/2,y+height/2,10);
  
  a =  - g / l * cos(theta);
  v += a;
  theta += v;
}

