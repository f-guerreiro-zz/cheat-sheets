var pens;
// pens = ["red", "blue", "green", "orange"];
pens = new Array("red", "blue", "green", "orange");
console.log(pens);

pens[3] = "purple";
console.log(pens);


var fourthPen = pens[3];
console.log(fourthPen);

///METHODS

var pens;
pens = ["red", "blue", "green", "orange"];

console.log("Before: ", pens);

// PROPERTIES:
// Get a property of an object by name:
// console.log("Array length: ", pens.length);

// METHODS:

//reverse()
//Reverse the array
//array.reverse()
pens.reverse();

//shift()
//Remove the first value of the array
//array.shift()
pens.shift();

//unshift()
// Add comma-separated list of values to the front of the array
//array.unshift(item1, item2, ..., itemX)
pens.unshift("purple", "black");

//pop()
// Remove the last value of the array
//array.pop()
pens.pop();

//push()
// Add comma-separated list of values to the end of the array
//array.push(item1, item2, ..., itemX)
pens.push("pink", "prussian blue");

//splice()
// Find the specified position (pos) and remove n number of items from the array. Arguments: pens.splice(pos,n):
//array.splice(index, howmany, item1, ....., itemX)
pens.splice(pos, n) // Starts at the seccond item and removes two items.

// console.log("After: ", pens);

//Create a copy of an array
var newPens = pens.slice();
console.log("New pens: ", newPens);

//slice()
//select a slice of elements from the array
//array.slice(start, end)
var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
var citrus = fruits.slice(1, 3);

//indexOf()
// Return the first element that matches the search parameter after the specified index position. Defaults to index position 0. Arguments: pens.indexOf(search, index):
//array.indexOf(item, start)
var result = pens.indexOf(search, index);
console.log("The search result index is: ", result);

//join()
// Return the items in an array as a comma separated string. The separator argument can be used to change the comma to something else. Arguments: pens.join(separator):
//array.join(separator)
var arrayString = pens.join(separator);
console.log("String from array: ", arrayString);

//concat()
//Joins 2 arrays
//array1.concat(array2, array3, ..., arrayX)
var hege = ["Cecilie", "Lone"];
var stale = ["Emil", "Tobias", "Linus"];
var children = hege.concat(stale);

//map()
//Execute a function with each array value
//array.map(function(currentValue, index, arr), thisValue)
var numbers = [65, 44, 12, 4];
var newarray = numbers.map(myFunction)

function myFunction(num) {
  return num * 10;
}

document.getElementById("").innerHTML = newarray;

//sample 2
var persons = [
    {firstname : "Douglas", lastname: "Ferreira"},
    {firstname : "Felipe", lastname: "Guerreiro"},
    {firstname : "Tio", lastname: "da Van"}
];
  
  
function getFullName(item) {
    var fullname = [item.firstname,item.lastname].join(" ");
    return fullname;
}
  
function myFunction() {
    document.getElementById("").innerHTML = persons.map(getFullName);
}

//sample 3
var persons = [
    {firstname : "Douglas", lastname: "Ferreira"},
    {firstname : "Felipe", lastname: "Guerreiro"},
    {firstname : "Tio", lastname: "da Van"}
    ];

function lastNameIsDaVan(){
    if (lastname == "da Van"){
        return firstname +" " + lastname;
    }
}

function testLastName(){
    document.getElementById().innerHTML = persons.map(lastNameIsDaVan);
}

//filter()
//Filters and only shows results that match the filter
var ages = [32, 33, 16, 40];

function checkAdult(age) {
  return age >= 18;
}

function myFunction() {
  document.getElementById("").innerHTML = ages.filter(checkAdult);
}

//forEach()
//List itens in the array
//array.forEach(function(currentValue, index, arr), thisValue)
var fruits = ["apple", "orange", "cherry"];
fruits.forEach(myFunction);

function myFunction(item, index) {
  document.getElementById("").innerHTML += index + ":" + item + "<br>";
}

//reduce()
//Subtract the number from the array starting from the beginning
//array.reduce(function(total, currentValue, currentIndex, arr), initialValue)
var numbers = [175, 50, 25];

document.getElementById("demo").innerHTML = numbers.reduce(myFunc);

function myFunc(total, num) {
  return total - num;
}

//sample 2
var numbers = [15.5, 2.3, 1.1, 4.7];

function getSum(total, num) {
  return total + Math.round(num);
}

function myFunction(item) {
  document.getElementById("demo").innerHTML = numbers.reduce(getSum, 0);
}