function item(off, over){
  if (status) return;
  this.off = new Image(); this.off.src = off;
  this.over = new Image(); this.over.src = over;
}

function cache(id, off, over){
  if (status) return;
  item[id] = new item(off, over);
  toc[toc.length] = id;
}

function over(id){
  if (status) return;
  document[id].src = item[id].over.src;
}

function out(id){
  if (status) return;
  document[id].src = item[id].off.src;
}

function mOvr(src) {
  if (!src.contains(event.fromElement)) {
    src.style.cursor = 'hand';
    src.bgColor = '#cdcdcd';
  }
}

function mOut(src) {
  if (!src.contains(event.toElement)) {
    src.style.cursor = 'default';
    src.bgColor = '#ebebeb';
  }
}

function mClk(src) {
  if(event.srcElement.tagName=='TD'){
    src.children.tags('A')[0].click();
  }
}
