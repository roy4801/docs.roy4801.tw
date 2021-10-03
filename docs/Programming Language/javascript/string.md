# string

## format

- `>= ES6`

```javascript linenums="1"
let soMany = 10;
console.log(`This is ${soMany} times easier!`);
// "This is 10 times easier!
```

- [sprintf.js](https://github.com/alexei/sprintf.js)

- Implement your own `format`

```javascript
if (!String.prototype.format) {
  String.prototype.format = function() {
    var args = arguments;
    return this.replace(/{(\d+)}/g, function(match, number) { 
      return typeof args[number] != 'undefined'
        ? args[number]
        : match
      ;
    });
  };
}
```

## Find

- `indexOf()`/`lastIndexOf()`

```javascript linenums="1"
var str = "Please locate where 'locate' occurs! locate";
var first_pos = str.indexOf("locate");
var last_pos = str.lastIndexOf("locate");
```

- [`search()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/search): search with regex
    - <https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Guide/Regular_Expressions>

```javascript linenums="1"
let str = '...';
const regex = /ab+c/g;
let pos = str.search(regex);
```

## Splice, Substr

```javascript linenums="1"
var str = "Apple, Banana, Kiwi";

str.slice(7, 13);   // Banana
str.slice(-12, -6); // Banana

str.slice(7);       // Banana, Kiwi
str.slice(-4);      // Kiwi

str.substr(7, 6);   // Banana
str.substr(7);      // Banana, Kiwi

str.substr(-12, 6); // Banana
str.substr(-4);     // Kiwi
```

## Replace

```javascript linenums="1"
let str = "Apple, Banana, Kiwi, Banana";
let a = str.replace("Banana", "PP");  // Apple, PP, Kiwi, Banana
let b = str.replace(/Banana/g, "PP"); // Apple, PP, Kiwi, PP
```

## Uppercase and Lowercase

```javascript linenums="1"
let str = "Hello World!";
let a = str.toUpperCase(); // HELLO WORLD!
let b = str.toLowerCase(); // hello world!
```

## Concate

```javascript linenums="1"
var a = "Hello";
var b = "World";
var c = a.concat(" ", b); // Hello World
```

## Trim

```javascript linenums="1"
let str = "       Hello World!        ";
let a = str.trim(); // "Hello World!"
```

## Padding

```javascript linenums="1"
let str = "5";
let a = str.padStart(4, 0); // 0005
let b = str.padEnd(4, 0);   // 5000
```

## Access

!!!danger
    `str[]` is read-only in javascript. `string != array` in javascript.

```javascript linenums="1"
let str = "ABCDE";
str.charAt(0);    // A
str.charCodeAt(0) // 72
str[0]            // A
```

## Split

```javascript linenums="1"
let str = "a,b,c,d,e";
let a = str.split(","); // ["a","b","c","d","e"]
// str.split(/regex/)
```
