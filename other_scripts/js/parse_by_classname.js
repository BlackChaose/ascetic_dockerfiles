/* name-of-class - parse class name*/
Object
.values(document.querySelectorAll('[class="name-of-class"]'))
.forEach(function(val) { console.log(val.textContent);});
