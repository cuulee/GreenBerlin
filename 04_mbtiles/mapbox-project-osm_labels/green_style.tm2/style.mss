Map {
  background-color: #000000;
}

#data_1{
  polygon-fill:rgba(0,0,0,0.1);
}

#data [zoom>10][area > 10000000]{
  text-fill: #000;
  text-halo-fill: #fff;
  text-name: [name];
  text-face-name: "Open Sans Regular";
  text-size: 13;
  text-wrap-width: 60;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-avoid-edges: true;
  text-margin:100;
  text-repeat-distance:100;
  text-placement:point;
}

#data [zoom>11][area > 100000]{
  text-fill: #000;
  text-halo-fill: #fff;
  text-name: [name];
  text-face-name: "Open Sans Regular";
  text-size: 13;
  text-wrap-width: 60;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-avoid-edges: true;
  text-margin:100;
  text-repeat-distance:100;
  text-placement:point;
}

#data [zoom>12][area > 10000]{
  text-fill: #000;
  text-halo-fill: #fff;
  text-name: [name];
  text-face-name: "Open Sans Regular";
  text-size: 13;
  text-wrap-width: 60;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-avoid-edges: true;
  text-margin:100;
  text-repeat-distance:100;
  text-placement:point;
}

#data [zoom>13][area > 100]{
  text-fill: #000;
  text-halo-fill: #fff;
  text-name: [name];
  text-face-name: "Open Sans Regular";
  text-size: 13;
  text-wrap-width: 60;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-avoid-edges: true;
  text-margin:250;
  text-repeat-distance:550;
  text-placement:point;
}