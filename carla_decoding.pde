ArrayList<Pic> pics = new ArrayList<Pic>();
int index = 0;
float aspect_ratio;
float alpha_step = 0.5;
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
}
void draw() {
  background(0);
  for (int i = pics.size() - 1; i >= 0; i--) {
    tint(255, pics.get(i).alpha);
    image(pics.get(i).img, pics.get(i).x, pics.get(i).y);
    if (i == index) {
      if (pics.get(i).alpha < 255) pics.get(i).alpha += alpha_step;
    } else {
      if (pics.get(i).alpha > 0) pics.get(i).alpha -= alpha_step;
    }
    fill(255);
    text(pics.get(i).alpha, 10, 20 * (1 + i));
    if (pics.get(i).alpha >= 255) index = (index + 1) % pics.size();
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