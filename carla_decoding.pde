ArrayList<Pic> pics = new ArrayList<Pic>();
int index = 0;
float aspect_ratio;
void setup() {
  size(displayWidth, displayHeight);
  aspect_ratio = (float)displayWidth / (float)displayHeight;
  println("aspect_ratio: " + aspect_ratio);
  pics.add(new Pic("http://saimg-a.akamaihd.net/saatchi/727700/art/2499115/1569111-GXYWWXGB-8.jpg"));
  pics.add(new Pic("http://saimg-a.akamaihd.net/saatchi/727700/art/2327903/1402717-8.jpg"));
  pics.add(new Pic("http://saimg-a.akamaihd.net/saatchi/727700/art/2327910/1402720-8.jpg"));
  pics.add(new Pic("http://saimg-a.akamaihd.net/saatchi/727700/art/2327916/1402725-8.jpg"));
  pics.add(new Pic("http://saimg-a.akamaihd.net/saatchi/727700/art/2332766/1406448-8.jpg"));
  pics.add(new Pic("http://saimg-a.akamaihd.net/saatchi/727700/art/2332792/1406469-8.jpg"));
}
void draw() {
  background(0);
  tint(255, pics.get(index).alpha);
  image(pics.get(index).img, pics.get(index).x, pics.get(index).y);
  pics.get(index).alpha++;
}
class Pic {
  String url;
  PImage img;
  int w, h, x, y, alpha = 0;
  Pic(String _url){
    url = _url;
    img = loadImage(url);
    float ratio = (float)img.width / (float)img.height;
    println("width: " + img.width + " height: " + img.height);
    println("image aspect_ratio: " + ratio);
    if(ratio > aspect_ratio) {
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