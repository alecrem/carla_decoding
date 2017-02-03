ArrayList<String> urls = new ArrayList<String>();
ArrayList<PImage> images = new ArrayList<PImage>();
int index = 0;
void setup() {
  urls.add("http://saimg-a.akamaihd.net/saatchi/727700/art/2499115/1569111-GXYWWXGB-8.jpg");
  urls.add("http://saimg-a.akamaihd.net/saatchi/727700/art/2327903/1402717-8.jpg");
  urls.add("http://saimg-a.akamaihd.net/saatchi/727700/art/2327910/1402720-8.jpg");
  urls.add("http://saimg-a.akamaihd.net/saatchi/727700/art/2327916/1402725-8.jpg");
  urls.add("http://saimg-a.akamaihd.net/saatchi/727700/art/2332766/1406448-8.jpg");
  urls.add("http://saimg-a.akamaihd.net/saatchi/727700/art/2332792/1406469-8.jpg");
  for (String url : urls) {
    images.add(loadImage(url));
  }
  size(800, 600);
}
void draw() {
  image(images.get(index), 0, 0);
}
aaa