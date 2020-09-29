let myFunc = (function(){
  let onFileSelect = function(event){
    let reader = new FileReader();
    let targetFile = event.target.files[0];
    if(targetFile.type === "image/jpeg" || targetFile.type === "image/png"){

      reader.onload = function(readerEvent){
        createImageElement(readerEvent.target.result);
      }
      reader.readAsDataURL(targetFile);

    }

  }
  let createImageElement = function(src){
    let targetDiv = document.querySelector('div.results');
    let tempImg = document.createElement("img");
    tempImg.setAttribute("src",src);
    tempImg.classList.add('preview_img');
    targetDiv.appendChild(tempImg);
  }

  return{
    onFileSelect:onFileSelect,
  };
})();
