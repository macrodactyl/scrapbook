'use strict';

const scrollbarMargin = 8;
const width = window.innerWidth - scrollbarMargin; 
const height = window.innerHeight - scrollbarMargin;

window.init = function setup() {
  const state = { angle: 0 };
  const canvas = document.querySelector('canvas');
  canvas.width = width; 
  canvas.height = height;

  const ctx = canvas.getContext('2d');
  const image = new Image();
  image.src = 'landscape.jpg';

  state.image = image;
  state.ctx = ctx;
  image.onload = () => window.requestAnimationFrame(() => run(state));
}

function run(state) {
  render(state.ctx, state);
  update(state);
  window.requestAnimationFrame(() => run(state))
}

function update(state) {
  state.angle += 0.001;
}

function render(ctx, state) {
  const image = state.image;
  // top left
  // ctx.drawImage(image, 0, 0, width/2, height/2);
  // // top right
  ctx.translate(width, 0);
  ctx.scale(-1, 1);
  // ctx.drawImage(image, 0, 0, width/2, height/2);
  // bottom right
  ctx.translate(0, height);
  ctx.scale(1, -1);
  ctx.drawImage(image, 0, 0, width/2, height/2);
  // // bottom left
  // ctx.translate(width, 0);
  // ctx.scale(-1, 1);
  // ctx.drawImage(image, 0, 0, width/2, height/2);
  ctx.rotate(state.angle)
}