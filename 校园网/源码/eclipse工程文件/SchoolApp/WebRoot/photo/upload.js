function init() {
	document.getElementById("upload").onclick = upload;
	var dropbox = document.getElementById("dropbox");
	document.addEventListener("dragenter", function(e) {
				dropbox.style.borderColor = 'gray';
			}, false);
	document.addEventListener("dragleave", function(e) {
				dropbox.style.borderColor = 'silver';
			}, false);
	dropbox.addEventListener("dragenter", function(e) {
				dropbox.style.borderColor = 'gray';
				dropbox.style.backgroundColor = 'white';
			}, false);
	dropbox.addEventListener("dragleave", function(e) {
				dropbox.style.backgroundColor = 'transparent';
			}, false);
	dropbox.addEventListener("dragenter", function(e) {
				e.stopPropagation();
				e.preventDefault();
			}, false);
	dropbox.addEventListener("dragover", function(e) {
				e.stopPropagation();
				e.preventDefault();
			}, false);
	dropbox.addEventListener("drop", function(e) {
				e.stopPropagation();
				e.preventDefault();

				process(e.dataTransfer.files);
			}, false);
}
var uploadFiles = [];
function process(files) {
	for (var i = 0; i < files.length; i++) {
		var file = files[i];
		var img = document.createElement("img");
		document.body.appendChild(img);
		var reader = new FileReader();
		reader.onload = (function(a) {
			return function() {
				a.src = this.result;
			}
		})(img)
		reader.readAsDataURL(file);
		uploadFiles.push(file);
	}
}
window.onload = init;

function upload() {
	for (var a in uploadFiles) {
		var file = uploadFiles[a];
		var xhr = new XMLHttpRequest();
		xhr.open('post', 'file', true);
		xhr.upload.onprogress = function(e) {
			if (e.lengthComputable) {
				console.log((e.loaded * 100) / e.total);
				// var percentage = Math.round((e.loaded * 100) / e.total);
				// img.style.opacity = 1 - percentage / 100.0;
			}
		};
		xhr.upload.onload = function(e) {

		};
		var fd = new FormData();
		fd.append("file", file);
		xhr.send(fd);
	}
}
