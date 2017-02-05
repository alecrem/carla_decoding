import processing.serial.*;
boolean debugging = false;
int slide_timeout = 86000;
int slide_started = millis();
boolean slideshow_on = false;
ArrayList<Pic> pics = new ArrayList<Pic>();
int index = 0;
float aspect_ratio;
Serial myPort;
void setup() {
  size(displayWidth, displayHeight);
  background(0);
  aspect_ratio = (float)displayWidth / (float)displayHeight;
  pics.add(new Pic("http://saimg-a.akamaihd.net/saatchi/727700/art/2499115/1569111-GXYWWXGB-8.jpg"));
  pics.add(new Pic("http://saimg-a.akamaihd.net/saatchi/727700/art/2327903/1402717-8.jpg"));
  pics.add(new Pic("http://saimg-a.akamaihd.net/saatchi/727700/art/2327910/1402720-8.jpg"));
  pics.add(new Pic("http://saimg-a.akamaihd.net/saatchi/727700/art/2327916/1402725-8.jpg"));
  pics.add(new Pic("http://saimg-a.akamaihd.net/saatchi/727700/art/2332766/1406448-8.jpg"));
  pics.add(new Pic("http://saimg-a.akamaihd.net/saatchi/727700/art/2332792/1406469-8.jpg"));
  fill(255);
  if (debugging) slide_timeout = 5000;
  String portName = Serial.list()[2];
  for (int i=0; i<Serial.list().length; i++) {
    println(i + " " + Serial.list()[i]);
  }
  myPort = new Serial(this, portName, 9600);
}
void draw() {
  int serialVal = 65535;
  if ( myPort.available() > 0) {  // If data is available,
    serialVal = myPort.read();
    if (debugging) println(serialVal);
    if ((int)serialVal == 1) turn_slideshow_on();
  }
  background(0);
  for (int i = pics.size() - 1; i >= 0; i--) {
    if (slideshow_on == true) {
      tint(255, pics.get(i).alpha);
      image(pics.get(i).img, pics.get(i).x, pics.get(i).y);
      if (i == index) {
        pics.get(i).alpha = (int)map(millis() - slide_started, 0, slide_timeout / 2, 0, 255);
      } else if (index == i + 1) {
        pics.get(i).alpha = (int)map(millis() - slide_started, 0, slide_timeout / 2, 255, 0);
      }
      if (pics.get(i).alpha >= 255) {
        index = (index + 1);
        if (pics.get(i).alpha > 255) pics.get(i).alpha = 255;
        slide_started = millis();
      }
    }
    if (debugging) text(i + ".alpha: " + (int)pics.get(i).alpha, 10, 20 * (1 + i));
  }
  if (index == pics.size() && pics.get(pics.size() - 1).alpha <= 0) {
    slideshow_on = false;
  }
  if (debugging) {
    text("slideshow: " + slideshow_on, 10, 20 * (pics.size() + 1));
    text("index: " + index, 10, 20 * (pics.size() + 2));
    text("slide: " + (millis() - slide_started)/1000 + "s", 10, 20 * (pics.size() + 3));
    text("total: " + millis() / 1000 + "s", 10, 20 * (pics.size() + 4));
  }
}
class Pic {
  String url;
  PImage img;
  int w, h, x, y;
  float alpha = 0;
  Pic(String _url) {
    url = _url;
    img = loadImage(url);
    float ratio = (float)img.width / (float)img.height;
    if (ratio > aspect_ratio) {
      img.resize(displayWidth, 0);
      x = 0;
      y = (displayHeight - img.height) / 2;
    } else {
      img.resize(0, displayHeight);
      x = (displayWidth - img.width) / 2;
      y = 0;
    }
  }
}
void turn_slideshow_on() {
  if (slideshow_on == false) {
    slideshow_on = true;
    index = 0;
    slide_started = millis();
  }
}
void mouseClicked() {
  //turn_slideshow_on();
}
void keyPressed() {
  //turn_slideshow_on();
}

/*
 // Arduino code for a pushbutton on pullup on pin 7
 int inPin = 7;
 void setup() {
 pinMode(LED_BUILTIN, OUTPUT);
 pinMode(inPin, INPUT);
 Serial.begin(9600);
 while (!Serial) {
 ; // wait for serial port to connect.
 }
 }
 void loop() {
 int val = digitalRead(inPin);
 if (val == HIGH) {
 digitalWrite(LED_BUILTIN, LOW);
 Serial.write(0);
 } else {
 digitalWrite(LED_BUILTIN, HIGH);
 Serial.write(1);
 }
 delay(100);
 }
 */