import com.jogamp.opengl.GLProfile;
{
  GLProfile.initSingleton();
}
float angle = 0;
PVector[] points;
int[] c;
void setup() {
  size(400,400,P3D);
  points = new PVector[8];
  for(int i = 0; i < 8; i++) {
    int z = i % 2 == 0 ? -1 : 1;
    int y = i % 4 < 2 ? -1 : 1;
    int x = i % 8 < 4 ? -1 : 1;
    points[i] = new PVector(x*50,y*50,z*50);
  }
  c = new int[8];
  c[0] = #ccaaee; // purple
  c[1] = #ff0000; // red
  c[2] = #00ff00; // green
  c[3] = #0000ff; // blue
  c[4] = #ffff00; // yellow
  c[5] = #ff00ff; // magenta
  c[6] = #00ffff; // cyan
  c[7] = #999999; // gray
  
  
  for(int i = 0; i < 8; i++) {
    c[i] = #ffffff;
  }
  
  
}

void draw() {
  background(0);
  
  translate(width/2,height/2);
  rotateX(angle);
  rotateY(angle);
  rotateZ(angle);
  
  strokeWeight(1);
  stroke(255,255,255);
  connectAllVertices();
  
   strokeWeight(10);
  //for(int i = 0; i < points.length; i++) {
  //  stroke(c[i]);
  //  PVector p = points[i];
  //  point(p.x,p.y,p.z);
  //}
  
  saveFrame("output/###.png");
  angle = frameCount * PI / 180;
  if(frameCount == 180)
    exit();
}

void connect(int i, int j) {
  line(points[i].x,points[i].y,points[i].z,points[j].x,points[j].y,points[j].z);
}

void connectAllVertices() {
    for(PVector p : points) {
    for(PVector v : points) {
      //println(distance(p,v));
      if(distance(p,v) <= 100)
      line(p.x,p.y,p.z,v.x,v.y,v.z);
    }
  }
}

float distance(PVector a, PVector b) {
  return sqrt((b.x-a.x)*(b.x-a.x) + (b.y-a.y)*(b.y-a.y) + (b.z-a.z)*(b.z-a.z));
}
